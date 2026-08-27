import os
from django.core.management.base import BaseCommand
from django.contrib.auth import get_user_model
from common.models import Org, Profile

User = get_user_model()

class Command(BaseCommand):
    help = "Create or reset admin account password and create default organization if needed"

    def add_arguments(self, parser):
        parser.add_argument("--email", default="admin@smecrm.vn", help="Admin email")
        parser.add_argument("--password", default="testpass123", help="Admin password")
        parser.add_argument("--org-name", default="SME CRM Pro Vietnam", help="Organization name")

    def handle(self, *args, **options):
        email = options["email"].strip().lower()
        password = options["password"]
        org_name = options["org_name"]

        user, created = User.objects.get_or_create(
            email=email,
            defaults={"name": "Quản Trị Viên (Admin)"}
        )
        user.set_password(password)
        user.is_active = True
        user.is_staff = True
        user.is_superuser = True
        user.name = "Quản Trị Viên (Admin)"
        user.save()

        # Ensure Org exists
        org = Org.objects.first()
        if not org:
            org = Org.objects.create(
                name=org_name,
                default_currency="VND",
                default_country="VN",
                timezone="Asia/Ho_Chi_Minh"
            )
            self.stdout.write(self.style.SUCCESS(f"Created Org: {org.name}"))

        # Ensure user has Profile in Org
        profile, p_created = Profile.objects.get_or_create(
            user=user,
            org=org,
            defaults={"role": "ADMIN"}
        )
        if not p_created:
            profile.role = "ADMIN"
            profile.save()

        self.stdout.write(self.style.SUCCESS(
            f"Successfully configured admin user: {email} with password: {password}"
        ))

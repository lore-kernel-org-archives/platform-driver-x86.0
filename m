From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Fwd: [PATCH] x86/devicetree: Fix compile warnings on AMD64
Date: Fri, 8 Aug 2014 12:23:00 +0200
Message-ID: <CAPybu_22j_XeTXZ1Po_6JWGtjdgzpOU2AkKFy-m8mMsX2LwuZQ@mail.gmail.com>
References: <1407230388-14211-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:43195 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755594AbaHHKXU convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 8 Aug 2014 06:23:20 -0400
In-Reply-To: <1407230388-14211-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: trivial@kernel.org, platform-driver-x86@vger.kernel.orgx86@vger.kernel.org

Hello,

Anyone interested in this patch? Which should be the proper mailing lis=
t?

Thanks!


---------- Forwarded message ----------
=46rom: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, Aug 5, 2014 at 11:19 AM
Subject: [PATCH] x86/devicetree: Fix compile warnings on AMD64
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
<mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
Grant Likely <grant.likely@linaro.org>, Rob Herring <robh@kernel.org>,
Michal Simek <monstr@monstr.eu>, Tony Lindgren <tony@atomide.com>,
linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>


arch/x86/kernel/devicetree.c: In function =E2=80=98ioapic_xlate=E2=80=99=
:
arch/x86/kernel/devicetree.c:294:8: warning: cast from pointer to
integer of different size [-Wpointer-to-int-cast]
  idx =3D (__force u32) domain->host_data;
        ^
arch/x86/kernel/devicetree.c: In function =E2=80=98dt_add_ioapic_domain=
=E2=80=99:
arch/x86/kernel/devicetree.c:323:4: warning: cast to pointer from
integer of different size [-Wint-to-pointer-cast]
    (void *)ioapic_num);

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 arch/x86/kernel/devicetree.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.=
c
index 7db54b5..a481d1b 100644
--- a/arch/x86/kernel/devicetree.c
+++ b/arch/x86/kernel/devicetree.c
@@ -278,7 +278,8 @@ static int ioapic_xlate(struct irq_domain *domain,
 {
        struct io_apic_irq_attr attr;
        struct of_ioapic_type *it;
-       u32 line, idx;
+       u32 line;
+       unsigned long idx;
        int rc;

        if (WARN_ON(intsize < 2))
@@ -291,7 +292,7 @@ static int ioapic_xlate(struct irq_domain *domain,

        it =3D &of_ioapic_type[intspec[1]];

-       idx =3D (u32) domain->host_data;
+       idx =3D (unsigned long) domain->host_data;
        set_io_apic_irq_attr(&attr, idx, line, it->trigger, it->polarit=
y);

        rc =3D io_apic_setup_irq_pin_once(irq_find_mapping(domain, line=
),
@@ -320,7 +321,7 @@ static void dt_add_ioapic_domain(unsigned int ioapi=
c_num,
        num =3D gsi_cfg->gsi_end - gsi_cfg->gsi_base + 1;

        id =3D irq_domain_add_linear(np, num, &ioapic_irq_domain_ops,
-                       (void *)ioapic_num);
+                       (void *)((unsigned long)ioapic_num));
        BUG_ON(!id);
        if (gsi_cfg->gsi_base =3D=3D 0) {
                /*
--
2.0.1



--=20
Ricardo Ribalda

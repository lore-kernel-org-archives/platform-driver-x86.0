Received: from mail-24428.protonmail.ch (mail-24428.protonmail.ch [109.224.244.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83F363B9
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Sep 2025 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757235989; cv=none; b=moODorBtjviGwie2udImxP54Ds7zZdwMpQWWxkVI66NzxFy9GR6DP1X6mH7FbM9289/qAn2Nsy7Xd8hSEY/QmSuEwqNq1etpkXWXreGXq6NFVX+r5t6jIOqYTRz0A0MttaE9QPf5Q6uQVrxe2KKr/8F4VZUCew029E5c6ShekCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757235989; c=relaxed/simple;
	bh=MinEf7LaTUmulyxWJM/xH5J7Ew/5fZCUHiVoBk60h2w=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QzttRCUoXMh8NPrisfOyKHSt1YvUK8YAUPxFANDHVFT5msDuVfZU9UwzeU1NoV81HZJkvhyODU/hbiMPVpATTBu+HeEVu9AhnokUM0J+388TYMIk3DJ1EIXxa0I1Tg9mBpVAoKxeZ1nJLuKb8Gdc+NI49O6oNtkVK7J5csUbRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PiUSudOt; arc=none smtp.client-ip=109.224.244.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PiUSudOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1757235977; x=1757495177;
	bh=MinEf7LaTUmulyxWJM/xH5J7Ew/5fZCUHiVoBk60h2w=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PiUSudOteY8KLXDfGWnqW4FoYIxmDcuSUTM2chfOCH8Fa/DLYJTpSvxG1f28NyhRD
	 QQc9y3ec7G83wyTd0Z3jq7lKfNauX1Z5Sp6oNNpqR6NDobfGbzh1jbMu0oBosnXGtB
	 fXp6XSjiVjF4y9shWS7G1fXGDcnaPcx1nfiG3cgsaXXcar0rbsuBLGOZy0pIYo/jwh
	 JMZHnJSV6cIcZ4zeAp1Qc1zeeoPdVt6AduiSIMJhBqq7oaJdmpcQx5wn1vspr3p7Sl
	 cQZjtEcePTXeWXRx9OVnBjw4pBRI8Q7onFDLp4DWRQGaXvOsUR5OUudCHUohpjnD+O
	 1FZ1Ji6AZ6kTA==
Date: Sun, 07 Sep 2025 09:06:11 +0000
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
From: aprilgrimoire <aprilgrimoire@proton.me>
Cc: "superm1@kernel.org" <superm1@kernel.org>
Subject: [PATCH v2] platform/x86/amd/pmc: Add MECHREVO Yilong15Pro to spurious_8042 list
Message-ID: <IvSc_IN5Pa0wRXElTk_fEl-cTpMZxg6TCQk_7aRUkTd9vJUp_ZeC0NdXZ0z6Tn7B-XiqqqQvCH65lq6FqhuECBMEYWcHQmWm1Jo7Br8kpeg=@proton.me>
Feedback-ID: 151975985:user:proton
X-Pm-Message-ID: b252c5718546369cabeff281fcb307a22a9665e5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The firmware of Mechrevo Yilong15Pro emits a spurious keyboard interrupt on
events including closing the lid. When a user closes the lid on an already
suspended system this causes the system to wake up.
Add Mechrevo Yilong15Pro Series (GM5HG7A) to the list of quirk
spurious_8042 to work around this issue.

Link: https://lore.kernel.org/linux-pm/6ww4uu6Gl4F5n6VY5dl1ufASfKzs4DhMxAN8=
BuqUpCoqU3PQukVSVSBCl_lKIzkQ-S8kt1acPd58eyolhkWN32lMLFj4ViI0Tdu2jwhnYZ8=3D@=
proton.me/

Signed-off-by: April Grimoire <aprilgrimoire@proton.me>
---
v2:
 - Fix subject prefix and wording.
 - Rebase onto platform-drivers-x86 fixes branch.

 drivers/platform/x86/amd/pmc/pmc-quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x=
86/amd/pmc/pmc-quirks.c
index 18fb44139d..4d0a38e06f 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -239,6 +239,14 @@ static const struct dmi_system_id fwbug_list[] =3D {
 =09=09=09DMI_MATCH(DMI_BOARD_NAME, "WUJIE14-GX4HRXL"),
 =09=09}
 =09},
+=09{
+=09=09.ident =3D "MECHREVO Yilong15Pro Series GM5HG7A",
+=09=09.driver_data =3D &quirk_spurious_8042,
+=09=09.matches =3D {
+=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
+=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "Yilong15Pro Series GM5HG7A"),
+=09=09}
+=09},
 =09/* https://bugzilla.kernel.org/show_bug.cgi?id=3D220116 */
 =09{
 =09=09.ident =3D "PCSpecialist Lafite Pro V 14M",
--=20
2.49.1


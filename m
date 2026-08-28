Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED340F749
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2026 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915589; cv=none; b=SrFy+XI06wsoGlcMekJ4XRc3h4r+yZFntXDuapZiUwtRNnPwleOYfEvOAwzycZxZ6hy87LFZm/kJn1gGX7265lD5quESOJMEgcOGRJdkE1+okhTjh289bWtAVDF6It78DDJ3Y2FqBBYehz1Q3tWiKQNkjAkBAbpy5g0qO6OWUbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915589; c=relaxed/simple;
	bh=TdMriYkbv+LpdFv3Sqoe5pN4dFFmT9Ro1TCTRJROYoU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rZlYbyMdMhegZlecDFSPTLAuEp3w4InHbkkyVp8Yi+imZrYDE4EICYLMCEFZCodqCnWyLKtCJVTKm7BkuxV29ca2gy/jsx2LNyJXVyWpLnjDuKStKk1TIXbd6rYnEc9lULaLLd/xysRBmFDOilb5lKrMi0J4GfcDsgLTCe0/JGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=JviBoo9u; arc=none smtp.client-ip=185.70.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="JviBoo9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail2; t=1787915583; x=1788174783;
	bh=e6ax1UYfO93rD7KNZl7aYI+OV805a2TWLlXpVVi/YZE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JviBoo9u8OVDLGff6CdNWP07oDcuo87qfewB7LxG/6ti9ET1imb8Zwkt+RRUP59C/
	 pze9Ud2K0UPAMNBECJRXrmYqV4Lip/2YmHcc27SWMkSYh4M9zOhCp/5I+TMR5eGxHA
	 8BEw1fzG4qA/LcBJBBEKXQkI04qAv6gcPvAXj3g3vALNKjUCzzn+7ZWmv+884IdzHE
	 2B3lmHrBSuSbqhmDewXa9RY0dWBtIwoM7RRoGCHJIPGH/MYhwSEOJ3TCJn+ihjH+Oo
	 jYo4taUuugUVZq6/0fZEiHIMurOUaYlHQ8btD73Ad7NKj77WHLX0gxMB0XVSUSIphM
	 7mEEfjeaXp2gA==
Date: Fri, 28 Aug 2026 11:12:57 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH 2/2] platform/x86: asus-armoury: fix pending_reboot for grouped attributes
Message-ID: <20260828111232.74443-3-yaseen@ghoul.dev>
In-Reply-To: <20260828111232.74443-1-yaseen@ghoul.dev>
References: <20260828111232.74443-1-yaseen@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: aa6b87ae0c7f95e9def0a382128e6e115e388086
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

asus_bios_requires_reboot() matches attr->attr.name against
"gpu_mux_mode" and "panel_hd_mode", but callers hand it a current_value
attribute, and that name is always "current_value". The match never
hits, so panel_hd_mode never sets pending_reboot or emits the
KOBJ_CHANGE uevent. gpu_mux_mode gets away with it because its
hand-written store signals the event itself.

Match on the group name instead, which armoury_attr_uint_store() now
has at hand.

Fixes: f99eb098090e ("platform/x86: asus-armoury: move existing tunings to =
asus-armoury module")
Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
---
 drivers/platform/x86/asus-armoury.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asu=
s-armoury.c
index 8e85fb08bd59..23aabc827e39 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -128,10 +128,10 @@ static ssize_t pending_reboot_show(struct kobject *ko=
bj, struct kobj_attribute *
=20
 static struct kobj_attribute pending_reboot =3D __ATTR_RO(pending_reboot);
=20
-static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
+static bool asus_bios_requires_reboot(const char *fsname)
 {
-=09return !strcmp(attr->attr.name, "gpu_mux_mode") ||
-=09       !strcmp(attr->attr.name, "panel_hd_mode");
+=09return !strcmp(fsname, "gpu_mux_mode") ||
+=09       !strcmp(fsname, "panel_hd_mode");
 }
=20
 /**
@@ -315,7 +315,7 @@ ssize_t armoury_attr_uint_store(struct kobject *kobj, s=
truct kobj_attribute *att
 =09=09*store_value =3D value;
 =09sysfs_notify(kobj, fsname, attr->attr.name);
=20
-=09if (asus_bios_requires_reboot(attr))
+=09if (asus_bios_requires_reboot(fsname))
 =09=09asus_set_reboot_and_signal_event();
=20
 =09return count;
--=20
2.55.0



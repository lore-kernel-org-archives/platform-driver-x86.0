Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C5D41C63;
	Tue,  6 Jan 2026 22:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767740149; cv=none; b=E0FPugFOVakjIedVLDighJcUjoUrzgCmr4KTU+r19Mh1jr+Vn7lqH8oPGJjY3Rt75d9oRl7cOrkAvZcnCmtsiXJ2VFydnj47rVAAtY278om2PhWvp9ytlgy3bCI7eR9CnHr6ezMnezOTQNT8Fh+11ecelbesTsu9hYn21yJU8Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767740149; c=relaxed/simple;
	bh=/Xuvgc9gmX2YyyUvj1eB8UiTsT6aZ0QDoYO+POU3FvM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UiY3VsDBhoGJy0Pg67Fc2raE9/0bwpG9+5hOD/vQuArRLBmNoCwP9SihjkEvKEgUPl96Y5n3fy97YU3bqQtw0V5rXl55XyF6EiaquLKJP1Kd0MaDB3JKKJgM3UNvp20jfS8Kf6aerndUGR5rTNeHRqeRm1SeYAYdheHSsiTESzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b68b20.dsl.pool.telekom.hu [::ffff:81.182.139.32])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000084104.00000000695D91BD.00394594; Tue, 06 Jan 2026 23:50:37 +0100
Message-ID: <bbe23884f43c34f9778f314ae0a5711b90858ab2.camel@irl.hu>
Subject: Re: [PATCH v1] platform/x86: ideapad-laptop: Fix resume behavior
 for Lenovo Yoga 15ILL9
From: Gergo Koteles <soyer@irl.hu>
To: Jakob <riemenschneiderjakob@gmail.com>,
  mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
  ikepanhc@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org, Jakob <jriemenschne@student.ethz.ch>
Date: Tue, 06 Jan 2026 23:50:36 +0100
In-Reply-To: <20260106220949.1518571-1-jriemenschne@student.ethz.ch>
References: <20260106220949.1518571-1-jriemenschne@student.ethz.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hey Jakob,

On Tue, 2026-01-06 at 23:09 +0100, Jakob wrote:
> On the Lenovo Yoga Slim 7 15ILL9, the Embedded Controller fails to restor=
e
> its state after resuming from suspend. This results in the cooling fans
> remaining stopped (causing overheating), the keyboard backlight and
> brightness keys becoming unresponsive, and the power button LED continuin=
g
> to pulse as if still suspended.
>=20
> Testing shows that invoking the UPHK method with command 0x09 properly
> resets the EC state. This single command restores fan control, fixes the
> keyboard backlight and brightness keys and corrects the power LED behavio=
r.
>=20

Based on the ACPI dump https://0x0.st/Ku-I.tar.gz from
https://bbs.archlinux.org/viewtopic.php?id=3D306675 , it appears that
this is a new feature (Win11 22H2) in Microsoft Modern Standby firmware
notifications (11e00d56-ce64-47ce-837b-1f898f9aa461).

If ((Arg0 =3D=3D ToUUID ("11e00d56-ce64-47ce-837b-1f898f9aa461") /* Unknown
UUID */))
{
   If (CondRefOf (\_SB.PC00.LPCB.EC0.UPHK))
   {
     ^^PC00.LPCB.EC0.UPHK (ToInteger (Arg2))
   }

Described here:


https://learn.microsoft.com/en-us/windows-hardware/design/device-experience=
s/modern-standby-firmware-notifications#turn-on-display-notification-functi=
on-9

I think instead of this driver, this notification function can be added
to the s2idle module (/drivers/acpi/x86/s2idle.c) without a quirk.


Best regards,
Gergo Koteles

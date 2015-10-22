From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Thu, 22 Oct 2015 12:44:08 +0200
Message-ID: <5628BDF8.9030506@gmail.com>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
 <bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
 <20151021085724.GA87951@vmdeb7> <20151021091954.GD15219@pali>
 <20151021110059.GF15219@pali> <20151021111243.GB87951@vmdeb7>
 <CABFtUbTZ6M4FQ3bAjKp1iKhkoybs9-RiL6B6sCgTVvEsdXJSrw@mail.gmail.com>
 <CABFtUbTF5k1Jm_pG6XiG1_9H8EwZQfvbXFuGWUjNZHd5YDgvXg@mail.gmail.com>
 <20151022074937.GA2581@malice.jf.intel.com>
 <CABFtUbTKUTfkeqE5nWKdNyrpbs3d2edNhMb8aSmSG_fBsMvcBg@mail.gmail.com>
 <20151022085117.GQ15219@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:38675 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751235AbbJVKoL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 06:44:11 -0400
Received: by wicll6 with SMTP id ll6so112849844wic.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2015 03:44:10 -0700 (PDT)
In-Reply-To: <20151022085117.GQ15219@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On 22/10/2015 10:51, Pali Roh=C3=A1r wrote:
> On Thursday 22 October 2015 10:26:47 Gabriele Mazzotta wrote:
>> I'll see if I can find a batter way to deal with this problem,
>> dell-laptop can detect the presence of an hardware switch.
>
> dell-rbtn.ko has acpi method CRBT which returns if notebook has hw sw=
itch or
> toggle key.
>
> And rfkill implementation in dell-laptop.ko does not work correctly o=
n
> XPS machines. And because userspace implementation of smbios works fi=
ne,
> I think that problem is in kernel driver rather in BIOS/firmware...

I was thinking about something such as the following, which should favo=
r
the hardware slider when available. This should work if my assumption i=
s
correct, that is the laptops with a working RBTN method are the ones
having problems.

diff --git a/drivers/platform/x86/dell-rbtn.c=20
b/drivers/platform/x86/dell-rbtn.c
index cd410e3..cf3c11c 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -321,6 +321,7 @@ static int rbtn_add(struct acpi_device *device)
  	struct rbtn_data *rbtn_data;
  	enum rbtn_type type;
  	int ret =3D 0;
+	bool has_hardware_slider; /* get this with SMI */

  	type =3D rbtn_check(device);
  	if (type =3D=3D RBTN_UNKNOWN) {
@@ -328,7 +329,7 @@ static int rbtn_add(struct acpi_device *device)
  		return -EINVAL;
  	}

-	ret =3D rbtn_acquire(device, true);
+	ret =3D rbtn_acquire(device, !has_hardware_slider);
  	if (ret < 0) {
  		dev_err(&device->dev, "Cannot enable device\n");
  		return ret;
@@ -343,7 +344,10 @@ static int rbtn_add(struct acpi_device *device)

  	switch (rbtn_data->type) {
  	case RBTN_TOGGLE:
-		ret =3D rbtn_input_init(rbtn_data);
+		if (has_hardware_slider)
+			ret =3D 0;
+		else
+			ret =3D rbtn_input_init(rbtn_data);
  		break;
  	case RBTN_SLIDER:
  		if (auto_remove_rfkill && rbtn_chain_head.head)

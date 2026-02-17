Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F318D352F8E
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 17:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771349356; cv=none; b=N4N+tDULFpWmBgsVR2Q65T6MSNQKj/sNJwOzyPGszBAzdivM3vTa7mX19zt9kNXVUwrQMCTFdlYuUKmuM5doN71jH6Jdrl5RH8EWqb7wwiH42g/tvR2hQKJnuzKaAO1kLtixNJCCTO6yQb4x3DsY4CPO4hQTnEzExo2/YLvRu1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771349356; c=relaxed/simple;
	bh=Yij5fZZZRmHb6NyG7oCtt/LojLe5/p1blbd5jgdeRYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYv2aQhojb8gq9L6yiVTizLiCGyvvzxHFZ/MUU63dY36xjA9ukmZSwo0NEeZZ0+ASnl36wsIlR6t2QT7GXqZOSJCd7JotlB5R2C6gNV+V8X2fbmiSoxgFYkl+6nZC3Spu5QjaPF9h5B360o11a+zKeM5O3XaAIiIzsiEcILed1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNqpoArn; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNqpoArn"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2baaceb4613so36998eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 09:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771349354; x=1771954154; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kS3j2x7e8OiNg75kmnXvxBkPNVNDmWhXcuz5sD9wtKI=;
        b=RNqpoArnZoNAedg4XQbWx6S3PEExQB4on237Cq8ZwAqfSJEKhlWAVKeTa9t24dHDef
         n3Fzk9HRweNlCSFThuJ87iV3+m97CASEJjU07wfwq5ivui2H+xzdFDpXtCymTSEnbQlm
         Axh3gSy6FfMn4OUoP4ewp/QgrsHvetlfOJ/o9PPRPVZSgcYJGF7FikJI4fOvjRL5qIe+
         zkBfDrBcu9zQxISwqfg12VHEmr0ovknCSEL48lg4BGAvnZtVdoEXiyL/A2m2jNmdS1lA
         8efL2abn05yHkYR6OFrh4wzCAKPjJVOEeudp9VBZw8ZS60CujHrcfA6GfqvzNUoHYd3Z
         7pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771349354; x=1771954154;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kS3j2x7e8OiNg75kmnXvxBkPNVNDmWhXcuz5sD9wtKI=;
        b=RTHS4Vsf9rrCRdBBsvGK4XiIJdZl3PQHsAGOfguSGG2TCgzlNKvENUAfidrkF+nC6v
         Qwx6+F/jSV56okw4/2Xkf/tObjDCc1l+5Tsnl3lPXPAZnzmnOlm7HkEwtqQcgrFLnNRz
         5SkrQWw3XQdzWqLXie4ZVXEXDhGXAdvuDF2nVyV4eG7sL0icpl9eDRWrdartFjnmD5ty
         OPE7Wzhk5f8G8X5JdpbCDvarSugeZdG7K0N1y8hcY2hk2SfOXcZ33YKcHOTxfcRchTLV
         NUItjj2tF/uFAaxDDx3XCmbTKme9bdImox3R5N1iDMBbpZcgP+Zi2FE5Dbw2eY0GuDwb
         PxYw==
X-Forwarded-Encrypted: i=1; AJvYcCXMwfZOP3Iemj/7RkEZqmSK2q/C9ny/AYcwF+HhMDMK6uAD7kb72DLVoJiVzekRW0XbQbVSdlzjzCa2yPqtHwiHsoWt@vger.kernel.org
X-Gm-Message-State: AOJu0YwUjXeAzB8AK8fxZ71ME0I3jqdQGJmYZTQWehZUCJ5zQA3PqMGw
	19U0HpuEt9wvFWqJK/1nrVJ3/RBYCHgHw3eZcyZsGa1gNlH9fakEve8N7+vGMQ==
X-Gm-Gg: AZuq6aKJrgpDsJRl1fvK0cFBS7J+ojkOO7kY+rFXADMIoAAlFz5jAyb03vNnn6qg4ak
	NuWlEPoOBSFW+mGRaU6ew7ZX4JPHjRyxQtBeIxfAaVZNkQuIJn5GdgYNccMyhXp1lvFa/yddM22
	JMTYjAVyPZ4ETggiMdmO2XLz9rRW7VIo5XNRI7wkzJBqAapmG07zmg+z9G0p0oRukir/lJjX7Eh
	GpyFkIuGNEsIa7J4tu2CoaVgPFAu+k5g5y89B5i6tGUgUf49HEHGi3EvJoqo2Dx7YzOILSQLGoD
	ap/WuL25eqQNK4iua3oJRsEJMlv5NwZ6bh1tfqzR/QngC3x/c5mAwsVS52RwyXm094fNrYGBE9O
	NmpTCAPOP4Ty8Q0iLOSMY+hon+NMqRKpVIJOXADgBvc4fEvkfOmy/N6M2rGqdjfZessRDj/oE5A
	Oq+SAfDkUnf1FaCChBrU8rqa/WpHIRAV9QTkbWRWjS/DZXIMJcrZlyw9AmEw7VuR/p
X-Received: by 2002:a05:7301:1004:b0:2a6:a306:efdb with SMTP id 5a478bee46e88-2bac71d4cd6mr4593376eec.3.1771349353845;
        Tue, 17 Feb 2026 09:29:13 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:968c:f102:3683:408a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb66b746sm17851209eec.25.2026.02.17.09.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 09:29:13 -0800 (PST)
Date: Tue, 17 Feb 2026 09:29:10 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tj <tj.iam.tj@proton.me>
Cc: Hans de Goede <hansg@kernel.org>, 
	"metux IT consult\"" <info@metux.net>, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: pcengines_apuv2: LEDs/Input fails since v6.18
Message-ID: <aZSkqGTqMp_57qC7@google.com>
References: <b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me>
 <ef96006e-ca94-4525-9727-4a6011fde7e1@kernel.org>
 <54082217-0eff-49f6-b4f1-0daed58c2568@proton.me>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54082217-0eff-49f6-b4f1-0daed58c2568@proton.me>

On Tue, Feb 17, 2026 at 03:25:01PM +0000, Tj wrote:
> On 17/02/2026 11:42, Hans de Goede wrote:
> > On 16-Feb-26 20:01, Tj wrote:
> >> Installed v6.19 recently and realised the heartbeat/network LED
> >> configuration I'd set wasn't working. Checking the log I see:
> >>
> >> kernel: platform gpio-keys-polled: deferred probe pending:
> >> gpio-keys-polled: failed to get gpio
> >> kernel: platform leds-gpio: deferred probe pending: leds-gpio: Failed to
> >> get GPIO 'apu2-leds/led-1'
> >>
> >> Looking through commits I found b8754092dfed4fc2fc
> >>
> >> platform/x86: pcengines-apuv2: Use static device properties
> >>
> >> After reverting it the LEDs operate as expected. This entered in v6.18
> >> so will affect it as well.
> >>
> >> In v6.17 I see:
> >>
> >> kernel: platform gpio-keys-polled: deferred probe pending:
> >> gpio-keys-polled: unable to claim gpio 0
> >>
> >> that is a slight variation on the v6.19 report. I've not pin-pointed the
> >> cause yet.
> > This should be fixed by this patch:
> >
> > https://lore.kernel.org/linux-gpio/20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com/
> >
> > If possible, please give a kernel with that patch added a spin
> > and confirm if it fixes things.
> 
> It fixes the LED issue but causes massive log spamming (10's per second) 
> related to the gpio-keys-polled:
> 
> [    0.000000] Linux version 6.19.2+debian+tj (linux@iam.tj) (gcc 
> (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #404 
> SMP PREEMPT_DYNAMIC Tue Feb 17 14:19:16 UTC 2026
> ...
> [    0.000000] DMI: PC Engines apu2/apu2, BIOS v4.19.0.1 01/31/2023
> ...
> [    6.025741] input: gpio-keys-polled as 
> /devices/platform/gpio-keys-polled/input/input0
> [    6.035231] gpio-keys-polled gpio-keys-polled: failed to get gpio 
> state: -52
> ...
> [   19.545273] input: Power Button as 
> /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
> ...
> [   21.742226] input: PC Speaker as /devices/platform/pcspkr/input/input2
> ...
> [  OK  ] Started dbus.service - D-Bus System Message Bus.
> [  OK  ] Finished e2scrub_reap.service - Re…line ext4 Metadata Check 
> Snapshots.
> [  OK  ] Started virtlockd.service - libvirt locking daemon.
> [  OK  ] Started 819142] gpio   32.-keys-polled gpio  32.-keys-polled: 
> failed to get gpio   32. state: -52
> 1;39msystemd-machined.service -…and Container Registration Service.
> [  OK  ] Started systemd-logind.service - User Login Management.
> [   32.930711] gpio-keys-polled gpio-keys-polled: failed to get gpio 
> state: -52
> [  OK  ] Finished grub2-common.service - Record successful boot for GRUB.
> [   33.050784] gpio-keys-polled gpio-keys-polled: failed to get gpio 
> state: -52
> [  OK  ] Started polkit.service - Authorization Manager.
>           Starting ModemManager.service - Modem Manager...
> [  OK  ] Started virtlogd.service - libvirt logging daemon.
> [   33.158927] gpio-keys-polled gpio-keys-polled: failed to get gpio 
> state: -52

I think the patch below should fix it.

Bartosz, I think you should revert
86ef402d805d606a10e6da8e5a64a51f6f5fb7e2 until after you audit all
existing gpio drivers. Breakign the kernel like that is not great.

Thanks.

-- 
Dmitry


diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index e6c6c3ec7656..9f329938202b 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -120,15 +121,15 @@ static int amd_fch_gpio_get(struct gpio_chip *gc,
 			    unsigned int offset)
 {
 	unsigned long flags;
-	int ret;
+	u32 val;
 	struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
 	void __iomem *ptr = amd_fch_gpio_addr(priv, offset);
 
 	spin_lock_irqsave(&priv->lock, flags);
-	ret = (readl_relaxed(ptr) & AMD_FCH_GPIO_FLAG_READ);
+	val = readl_relaxed(ptr);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	return ret;
+	return FIELD_GET(AMD_FCH_GPIO_FLAG_READ, val);
 }
 
 static int amd_fch_gpio_request(struct gpio_chip *chip,

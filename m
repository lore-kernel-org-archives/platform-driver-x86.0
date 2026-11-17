Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794943152;
	b=lVjQNbwX9eTxaAk2EcBzP5G8HFSUvNo+jXYghNELEIxGz34D7j5NYACXlu/ecbPqJjmw
	 vtiJnWZ8ArJLesYRWM6vPiHrIqTMFeqcEAFusRIE83v/Uh+zn2uhdP4gNx9MRAX8YbfjY
	 qi517P3qSSj79E65m/NQF4qvBLLXF7NGR85yucZrzybIVYpXzUTGUZfUKVI4keAGhAkEJ
	 1RyI+JSYBfeNDYbQf33/WrPvWMu8Snqtr4nq3SAQ+qA/zeK+aD7flsaYSEQQ+I5Yod8vY
	 kYsE2apQcsmF4fvrdD0eCVSQeJPPRe9sOwmyPIvylthhL8RFsvvCU0mlClFxSylFhRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=LMTPzjShjCPD69osaUUpYC4vaplqgyOI3+4p6kklAx0=;
	b=hMyKa4P7Vp2mFt6BDVC8de2mzUNOIFtpKUMkxTEaLYnRSN6jdLZay9O8vmRAHUTCYVAa
	 KhoH+omGW8rKKN41E6R42BOkR3C7u8Rw0P4ypr+UufJjfd5yBFiqWNzck8NQyDgkUlVBY
	 O4Yxk0DfxLDCEYstGQzeZGes/RbhC/TaMoFhtk/mENsgk3qWdinllIRpAX4oqiT50y2m1
	 Bvjy5g6j7zv1qMD6D2cODGnlt7kKQrfFgxPI1I02Tfm1LR0KNNnkt4wromWY82XVSv2iS
	 /2KnVFHQ56Bc7QrTopT1XEBoDMC0Whydoc+IUZKbtvbkL1zZ0etT/vLFiBetCfpH6hA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OF0a8zmh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC88606A32F
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 19:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC88606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OF0a8zmh
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-53ec2cc397aso39765b6e.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 11:19:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794943151; cv=none;
        d=google.com; s=arc-20260327;
        b=Jmap+vji2PRiS9Q8GM/HtiuFooK659h8YMGuWZ6lQAbY6sXnZi4yAoCR3am0vECO7g
         85hTS/VzhsMFjUTePdwa9+5WyQvorCLxJ6RX8qmFONDHHbXb0qGkW3s4CpVJhsEAb8Nm
         h60qeozfEuY4fNY7VoYx4znVsYXO79Vg01yvJ/oF/qGTbdME5Qwi1wAt5F9J47nKKa5E
         694rnU5w0WznJ4KKYB7VGnvaOPCAcLVR5cAmXVJ8Nv8QIQKo2tEFGZCMhsE+K3lVcdzA
         37HCmX37b9Sv6I4wjiaaPxCJBbcZD2xmvcVBUHbF+m8XTB9bvapQTNeUj5v7DTEAx7vU
         2syw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LMTPzjShjCPD69osaUUpYC4vaplqgyOI3+4p6kklAx0=;
        fh=xZh46pr9wBI3TG1zPzVO3FoaL2aiEvOQmuc2pE8ykVo=;
        b=f58MGy9Wgk7zp7Mw0PQoFOpMYuK+H1g6pTPlhoFfxN/Ke2JsiEFsQZmrvOFJzn3PB9
         Ii0RTK28KkYBSMuFlTgQgb7Uc2HdLsuKDIQR0vgg+UDXm4Y55rVBf3IXJ50b7uVietiu
         DnwSZPf4AGP1H2xd7Ktno+S7Ky0EZDavX1GhHmBtKIuFCkL18jWXB9feWliJdtEXXka7
         ZWKc+8RT4H3d7WZtY84igT3v+VJLXJSp22QdDcRBJg+pcN8/QX0UKXJNzF6MWPCtUZT/
         yVxiWR2Z+x9lVCta0ZnpG9lnJVtsqCSDwHgspGcnWFmTKBoZg/96lgRoVe5XcD6GQ+S6
         f+iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943151; x=1795547951; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LMTPzjShjCPD69osaUUpYC4vaplqgyOI3+4p6kklAx0=;
        b=OF0a8zmhI/ezuJwFG35FCyje2Ub40UTqp4YuEEikrb7TCfF41li/SthOAW5zvETTHq
         Q2PneylCaI5h/L11vpfiUKw/MTP/3Huu7oCyJbNw9/4a1S6kac5Q9rRP0RIOWSSb0gkp
         0F1se9z8P+zVFX1sOHQzB2mAY6WM7RXyPTZU7hwqRMZvJKuezkAdRnl3m4AZKIXKKE0k
         EC+WwOagMiNaH04168ax/NaNRRfic0RMH5Zx7G7WyTOok6R/q+yfTkSl3I3YZJorSFpl
         tZErSx1w/y2rq8HrPObtTOZnfOCzTmmHOhKErV+N1zoJkeJ99vFOK1sdpvwAezeLlW8b
         iRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943151; x=1795547951;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LMTPzjShjCPD69osaUUpYC4vaplqgyOI3+4p6kklAx0=;
        b=QWaNWfj4lWeM2mfkpd05DhoM6hiACABIhaii7MNUE7TAXZ6nMa9vPdGb16HN7wuuwH
         DKHKd0z2Ekom6jhCl0T27HZFvuuTMB5C3ZyuQCcWuR2RIHcO6w9RWVVBEQz60w6mGo6u
         IU2fH2V1NL/i+R7RbEviO7y08NZ+YdZcgKyYW2qRJtt+UeqxAS/MI6rKAxg/2itUH8KS
         kZcJn4SCdOFf5rbO4qkEdPEoEu1LxloQ6OKiA7w0whg/2HV/cut7ilyqoKLRdsi1nNbF
         ajsxj/EKYkqKdaJ4Y21FyuPGCR5IPtlnA6Ljmpal2fldlqrkzrijrNH+k5tfx5vJeckr
         5uJQ==
X-Gm-Message-State: APuU4Z/UYAURemLrU7qI9DRMzK4PT7Jn7fHIPUl2Xfx+LLhFtsthbR7d
	zvPM/TYCPXVWDBB05zTt8lqN4ockcfkSPKuA7dNs5OIAEmHRlB7xrgBtxj3YXsaHw/P/VtezKTU
	RQpCKmaUQNVYMAiE9YDvhNRfZjiA/NoZzYBcp
X-Gm-Gg: AYBFou1pA1BUDYsrTT4W7G8HHIFZRZQVgSuYNaJg+8s1T3SD4yfvfcEBYwYbMk6UG0A
	0soomUs5HbEVcgq3O85ZnoIHnHxlorAQ/SHOLfPOFntrxTigjNV7Z9zuEVIY1J9PCCgzNbOy0nv
	GBKXEWhKK2wE8/0+zaw1Sgto9dMGAjJPr+zg57xeZ/dO+a+kRQGB9/aqVxPlAltTJB386uVPRju
	+4tPf3Zf3nkgPX94CJTUaSpz66V0h8YTYnCT0YTzuTnde+nRYAerjf68z3nFEUKZr4Td8xSEPFs
	E1PWAIKHpYhnGO9rFFyH2I3Djg/cyCKIex51tKFwvHlKIw87pMmSxfJaHTqKUWIf+kJ0u9klinJ
	ukWXrXs9/vCdo79JBQrENUxg4BOdwXpLCK9klBdEJeY+DWIY9vZwTumkj38udqsrLj4eITQ==
X-Received: by 2002:a05:6808:6415:b0:564:3fe1:2f87 with SMTP id
 5614622812f47-5773a8ecb37mr870048b6e.4.1794943151323; Tue, 17 Nov 2026
 11:19:11 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Vorname Nachname <ivanhoe18109@gmail.com>
Date: Tue, 17 Nov 2026 20:18:59 +0100
X-Gm-Features: Aa3M54rdgeQxZG65QoPSbr3SCg6VScFXGGRJL0zZM49XX9vGUbf0Y8eIH9LGlKs
Message-ID: <CAF1sT3XO1qAubErt+85t316XyoqAW3LttUmKUHVBsrVYt7Y1NQ@mail.gmail.com>
Subject: platform/x86: lg-laptop: Add LG Gram 16T90TP to keyboard backlight
 quirk table
To: platform-driver-x86@vger.kernel.org
Cc: W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"

Hi Armin, hi platform-driver-x86 maintainers,

I am using an LG Gram Pro 2-in-1 (model 16T90TP-K.AA78G) on Fedora Workstation
(Kernel 7.2.13-200.fc44.x86_64).

Just like the 16T90SP model, the keyboard backlight is detected under
/sys/class/leds/kbd_backlight (via LGEX0820:00), and changing brightness values
updates the sysfs file, but the physical LEDs do not react at all.

Could you please add the 16T90TP DMI entry to the new keyboard backlight quirk
table in drivers/platform/x86/lg-laptop.c (alongside 16T90SP)?

Here are the exact DMI identifiers from /sys/class/dmi/id/:

grep . /sys/class/dmi/id/{sys_vendor,product_name,product_family,board_name}
2>/dev/null
/sys/class/dmi/id/sys_vendor:LG Electronics
/sys/class/dmi/id/product_name:16T90TP-K.AA78G
/sys/class/dmi/id/product_family:gram Pro 360
/sys/class/dmi/id/board_name:16T90TP

If you need any additional ACPI tables, dmesg logs, or testing for a patch,
please let me know and I will gladly provide them.

Best regards,
Gabor

Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B4F219E38
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 17:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731432690; cv=none; b=G6YpZ09i1SvL9YXIT85+MYxhpz54Scg1A018bspqdVQLFAaq/PlTLdeUsSox+6Hm75X5u8kk/odsJEcBtmR1dQfcKBEyQwAnmmrXpw4fvlNbpSAo6RPht042EPgtp545t/mNgeY+daIuX6qe7yhwnqdHVLp7cVBBUrp52THU30U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731432690; c=relaxed/simple;
	bh=ycVEup3OHbZpb8QT5+l0bFBNjeJ1pj3efCUYGy/ltCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ahvGXLByqhg0wY7hra08mJ31eDkoGBx90O16cEFFO132mRdCzlC5FrNse2QcU/jUB4sVt0EjvxfW6yTc/7BPzz4s/iSKh13fRLHsG6BquJyBNt3qTrzv/iCCp5cptMmV24/OEXM9gqPwundevSDUPVkKEIjhXe3d+ApN+4kJdqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JVJyXlzq; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JVJyXlzq"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e9b4a5862fso3390425a91.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 09:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731432687; x=1732037487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fI0dnkfI30Hz4AiV9HLb+qwYWhV2B4MukkmqKKi0GYY=;
        b=JVJyXlzqBBfrWnwiHYG5g1ESGfhvV/XMjeU7V8szT7zQbt8Gcg1Lf8F1AM1iK3pQ6g
         ZCH6lFwow1H7hQG2qeYdIdPV/dQGQzLb//ogqjbyKATjYo2OEp6Y3zS2CehL+TtwW8o3
         WrePfJMg1xuSRh0+TID4++BD1r0WaxBwvUsDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731432687; x=1732037487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fI0dnkfI30Hz4AiV9HLb+qwYWhV2B4MukkmqKKi0GYY=;
        b=dx0b9QqeF4nLsfz3B8JGzDl8EdtRh4sDhUy0MrmQ9Ymi2eMj3nAOJiSLFzfNz5eYr6
         KaZ4ync7MPfzFMR0hDay853EkVyycU7BzM5PoxqU2Rj//JdRD8LUfoapnMidfmEidLG1
         VImf4QL2dUk4h+thyyveiPHRt/vfHArNy9dXUHjD8Wn5nFuL4++brqEFxNtyYZL9XPck
         4fLn/vASSoAAxr3CJLo5gNkdguVgyU094EUwRbfJg3zcYJCPti47sPfDOyIw3Z2zmLNh
         fR1EYgpiqkiMuke0yAeIwy5kseGdj96HBl3QhIP4Qu4xPRKzeKcjLEVd6rjGOvG/5YUy
         r7/A==
X-Forwarded-Encrypted: i=1; AJvYcCWXCyjmCdgvtkIMXdMCsUSqMOY15G2EUPR6C8WcSmIXxQQGMmEx2X/diGylReliPENOkj2KPDKf3MTDPOasgjAQxVa/@vger.kernel.org
X-Gm-Message-State: AOJu0YzQZsp/ZML7QsDdB59P0QslT/lsOkhk8BnQ3VCnJfjHKcsXH7Xj
	81UOMD/HBUcy+lNpOikUt3kuIonMaOzfE36eq5rgUGegQcZcCrPv4lKUX1frog7vB1joto1BS4o
	=
X-Google-Smtp-Source: AGHT+IGhjq7iVIDfco6f66MkREkYhdk7E4mLxJzyB/24Z2NLJIxkAc3alan/vU/GukK/CJPsRITgJA==
X-Received: by 2002:a17:90b:2ec8:b0:2e2:b46f:d92a with SMTP id 98e67ed59e1d1-2e9e4adeecbmr4435342a91.14.1731432686619;
        Tue, 12 Nov 2024 09:31:26 -0800 (PST)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e77ad1sm96185325ad.261.2024.11.12.09.31.24
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 09:31:25 -0800 (PST)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7f3f1849849so4106520a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 09:31:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKG663EyKt5XyyMGQkOKA6xpsbIsqCFojmvwV9zgax/GbBpInoxm58S3QOzb9pb9csuuqBPSlkgF3zvXB0iF4VyiLt@vger.kernel.org
X-Received: by 2002:a17:90b:3e8c:b0:2e0:cac6:15f7 with SMTP id
 98e67ed59e1d1-2e9e4930710mr4676383a91.0.1731432684259; Tue, 12 Nov 2024
 09:31:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org> <a644fed4-aff5-4514-8e35-d6cab642d3dd@redhat.com>
In-Reply-To: <a644fed4-aff5-4514-8e35-d6cab642d3dd@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 Nov 2024 18:31:11 +0100
X-Gmail-Original-Message-ID: <CANiDSCtecYwfzSGDOHAtkdSrDb5WjtxAQMikH=tLPqngGXbBkw@mail.gmail.com>
Message-ID: <CANiDSCtecYwfzSGDOHAtkdSrDb5WjtxAQMikH=tLPqngGXbBkw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a subdevice
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 11 Nov 2024 at 13:59, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ricardo, Et al.,
>
> On 8-Nov-24 9:25 PM, Ricardo Ribalda wrote:
> > Some notebooks have a button to disable the camera (not to be mistaken
> > with the mechanical cover). This is a standard GPIO linked to the
> > camera via the ACPI table.
> >
> > 4 years ago we added support for this button in UVC via the Privacy control.
> > This has two issues:
> > - If the camera has its own privacy control, it will be masked
> > - We need to power-up the camera to read the privacy control gpio.
>
> Thinking more about this I think we need to start with looking at the userspace
> API for privacy controls, define how we want that to look and then go from
> there.
>
> The reason I'm writing this is because due to my work in drivers/platform/x86
> (pdx86) on EC / ACPI / WMI drivers for non chromebooks I am aware of at least
> 4 different methods camera on/off (aka privacy) toggles are being reported
> to userspace at the moment. Adding a v4l2-ctrl on a subdev instead of directly
> on /dev/video# would be adding a 5th method which seems highly undesirable.
>
> Instead I would like to first focus on fixing these userspace API
> inconsistencies agreeing on a single API we want to use everywhere
> going forward. We don't need to fix all drivers at once, but IMHO we
> should agree on what the API should look like and document that and
> any future drivers implementing camera privacy control related code
> then must use the new API.
>
> Lets start with the 3 APIs I'm currently aware of:
>
> 1. uvcvideo driver exporting V4L2_CID_PRIVACY on /dev/video#
> uvcvideo seems to be the only user of this CID (i)
>
> 2. pdx86 drivers exporting an input evdev with EV_SW,
> SW_CAMERA_LENS_COVER. This is somewhat of a special case
> for some Dell laptops with an electro-mechanical shutter
> operated by the EC. But this is not also used by
> hp-wmi.c where it does not necessarily indicate the
> status of a mechanical cover, but also possibly simply
> disconnecting the camera from the USB bus.
>
> 3. pdx86 drivers exporting an input evdev with EV_KEY,
> KEY_CAMERA_ACCESS_ENABLE, KEY_CAMERA_ACCESS_DISABLE
> These KEY codes are based on offical the HUTRR72 HID/HUT
> extension and as such may also be send by USB/I2C/BT HID
> devices.
>
> The only user outside of hid-input.c is the recently added
> drivers/platform/x86/lenovo-wmi-camera.c driver and I'm
> wondering if that should not use SW_CAMERA_LENS_COVER
> instead. I'll ask the driver author about how this
>
> 4. pdx86 drivers exporting an input evdev with EV_KEY,
> KEY_CAMERA. Note this 4th method lacks information on if
> the camera was enabled or disabled. In many cases this
> is send to indicate that the EC has either dropped
> a UVC camera of the bus, or added it to the bus.
> Ideally we would have some helper checking for internal
> UVC camera presence and turn this into 2 or 3.
>
> TL;DR: it a mess.
>
> Circling back to this patch-set, note how 3 of the 4
> currently in use variants today use in input evdev.
>
> I think that using an input evdev (shared with the
> snapshot button if present) will give us a nice out for
> the power-management issue with the V4L2_CID_PRIVACY,
> while at the same time giving a nice opportunity to
> standardize on a single userspace API.
>
> My proposal would be to standardize on SW_CAMERA_LENS_COVER
> I realize that the GPIO does not always indicate a lens
> cover, but the resulting black frames are the same result
> as if there were a lens cover and looking at:
>
> https://support.hp.com/ie-en/document/ish_3960099-3335046-16
>
> and then the second picture when expanding "Locate and use
> the webcam privacy switch" that does look like it may be
> an actual cover which reports back its state through a GPIO.
>
> The reason why I'm not in favor of using
> KEY_CAMERA_ACCESS_ENABLE + KEY_CAMERA_ACCESS_DISABLE is that
> looking at the HUTRR72 it talks about:
> "Enables programmatic access to camera device"
> which suggests that it is a request to the OS / desktop-
> environment to block camera access at the software level,
> rather then reporting back that a hw-level block is in place.
>
> And since these may be used by any HID device we are not of
> control in how these will be used.
>
> Ricardo, what do you think of instead of using a v4l-subdev,
> using an input evdev (shared with the existing one) reporting
> SW_CAMERA_LENS_COVER ?  The v4l-subdev approach will need
> userspace changes anyways and if we are going to make userspace
> changes we might as well use the best API available.

I just sent a patchset using SW_CAMERA_LENS_COVER

I guess the internal uvc privacy (UVC_CT_PRIVACY_CONTROL) shall NOT be
converted to evdev:
- If we do so, we cannot differentiate external gpio and internal, for
devices that have both
- There is no warranty that we will get a uvc_event when the control
changes, so we would have to constantly poll the device

Regards!



>
> One downside of going the evdev route is that it is a bit
> harder for userspace to map the evdev to a camera:
>
> 1. For the various WMI interfaces this already is impossible,
> and just to show a notification it is not necessary (using
> an external cam will make things weird though).
>
> 2. For UVC cameras mapping the evdev to the /dev/video#
> node can still be done by looking if they share a parent
> USB interface. This is e.g. already done in apps like
> xawtv looking at the PCI parent to pair up /dev/video#
> for video capture with the ALSA interface exposed for
> sound by bttv cards.
>
> 3. We can maybe do something at the media-controller
> level to help userspace linking a camera to its evdev node.
> This would also be helpful for the existing WMI interfaces.
>
> Regards,
>
> Hans
>
>
>
> i) With the exception of drivers/media/pci/intel/ivsc/mei_csi.c
> which has a V4L2_CID_PRIVACY control which always reads 0, so
> I guess we can / should probably drop that.
>
>
>
> p.s.
>
> I do plan to also get back to you on the actually powermanagement
> discussion. But only so many hours in a day, so it will probably
> be a couple of days.
>
>


--
Ricardo Ribalda

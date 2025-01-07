Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71521EE7AD;
	Tue,  7 Jan 2025 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249829; cv=none; b=bRQzSUSdEObwU7fY+zb06rxnnkznKQNuMGyH5mt172vvSsKnI91WiwX3sivaXfKeYTG52Wpcqu0baYH7lqErq+pKhXjjUgcbrWw2ociJSfciCpnWmhqoKJq3XXXd9dCHCotdjILp9Jmjj1gVt7GblHumVigzA9OQSeptkia5yLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249829; c=relaxed/simple;
	bh=BaF6mc8hO8UsCK4VeBN1qPwU5pIq0WM+VgP+lBuffwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0KQ4Zjh/bHupCwYg/hmPzjC82Dd3+HmApT44gsVpEeIbL4Wv6Zfhv8iPRk5ZshupdUn6dGajRXgdu+AloHDYn74hFWUD+qOm38Q9Z5DCL72uxQzlxRfF0p3yleTYlRbu4QwVqfi2VboVUYapHfwZ7lGHbFornnuYiSrHW1wzMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-844ee166150so562949239f.2;
        Tue, 07 Jan 2025 03:37:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249826; x=1736854626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaF6mc8hO8UsCK4VeBN1qPwU5pIq0WM+VgP+lBuffwo=;
        b=gbs5s2CeqlL0jgYPkSmfzSSAy+FKWT1VWkMU8sgcXqQtkPRADqhTlo913sNInBrus3
         /IWbPXVQ38nxxOF5VWk+dutBDMxCvEl/31ALcTJUxa3aJloV1jKy/UuiV0VDJBYYGboa
         cnQpgsU7EA9pw0S+s43IJkzLbMYKb6DO8xTsTx4IVFj/RYp+OSqqmLJgyDnhk5Miffj5
         n4qBHuVyHMVSRn8Bc3IrXsuB9uPLf03CUFcR/ZsjnWtLhHG+hLLrrucKzE1jnvtYw9Q8
         aO8SD3d7EENuPJOuOrju3iiXPxOIoyzKjBo0mJAh6VsmWPLJyvAyqcR7kCxqmCJY/l1A
         q7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUvDHmGnlMwnSsIRZqn5XHaLF8KzFHKOY/Gow22TOWlKRVtTdreEzxZKKitDq5hB0B23JA5wykduR7UCjba@vger.kernel.org, AJvYcCW7fhjwalads/IjTPohsn5KHlVKauSt6tuGNGUh3uDPaYPKKwPnkKuiLbYO4xxO8owELvRmMlt7JeU=@vger.kernel.org, AJvYcCXBpYQFHFiQuQhpAhbyNPoLyVD4plHDGynhxz63/QRfeUJ6hRl/RA5V6thj6tNfV5EORdoEZXLDRqZI923fkt1tJxjnLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKZDcBin54Yb/gJkuZacalK134xbRKn+oAowQXqLwgRb9tDdxn
	wRJaQh+FJ0oVWUnhucJShHMwGwZU7Q05zahyn1MQdWljJ9LkgoANcEuRX1E6
X-Gm-Gg: ASbGncu3DR8jOosqFHosHFRgB+qgBtSG8mg4LoYhFb7JzAmsfzOdq1PHwIhtjkOZkwn
	Iy5iHzKUm3da3K+amKv5swntZ3kgcJcGx4JMbfDeF3+tQ2V8wB4g3Hy+eSR5Aqcn4f0E13ttXc0
	Ce8NccHR4IeQFRpYQBjw4bx12MsiEYsYjEo3vy292AOCIA7H5rtzbCqYlq7kYOcmvkwN28UxW3L
	Vc+nahTiCHnnIfxTKWuhP+j6fO7YMeBjaW6SWIgFL9rEya1CZ9XRtQK2QQZ0WZSM54mxBC1/4Lz
	Wlp+jE5IisGKTRgp3UmvNg==
X-Google-Smtp-Source: AGHT+IH/otdtaDl5mZy10GGJHdgJSDgTAWNOVEcdNLdrVhaS8Zq/yZ+TK1x52VTXCmGTzzI/QCpJtA==
X-Received: by 2002:a05:6602:4a0a:b0:843:e908:db0b with SMTP id ca18e2360f4ac-8499e6c019cmr5379683639f.10.1736249825966;
        Tue, 07 Jan 2025 03:37:05 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c1df18bsm9656753173.137.2025.01.07.03.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 03:37:05 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844e7409f8aso648472539f.1;
        Tue, 07 Jan 2025 03:37:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0pLg+F7jp0+6sTEduHlbxMlaNRnwtAK+K5EC/+2SKEO1nib29B91MNsJG7vN712a8uu0vig94YuKieXQN8YL0pEPjUA==@vger.kernel.org, AJvYcCXfZ2I0KtBIcG5gs2kKVOSio2oLwbQj9rT/75KobYWNn56JX5FeTbR9heE4F3ff1WavxXIiXul5AjZU4ZzH@vger.kernel.org, AJvYcCXr7ciI3uBmpkLHt+iYXG/dXvGy9HZwJzpsYJ4Dn2Izqi6dOotVAUW/OdGz0R3XeRPMgSJQ94er+rE=@vger.kernel.org
X-Received: by 2002:a05:6e02:156d:b0:3ab:1b7a:593e with SMTP id
 e9e14a558f8ab-3c2d514f9ebmr556336505ab.19.1736249824972; Tue, 07 Jan 2025
 03:37:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216103855.18457-1-josh@joshuagrisham.com>
 <13184052-baf2-4e7d-b8ef-9ba3f34d475a@t-8ch.de> <66897a27-5f81-46fc-898d-682456d7f37f@redhat.com>
 <CAMF+KeZ3uAWZuuPJcrrvTJS-TgyxkqXOY_w=wNw7eZQiUkV5YA@mail.gmail.com> <bfd9b7a4-ebef-49ff-8b86-bd61b1a06d38@redhat.com>
In-Reply-To: <bfd9b7a4-ebef-49ff-8b86-bd61b1a06d38@redhat.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Tue, 7 Jan 2025 12:36:53 +0100
X-Gmail-Original-Message-ID: <CAMF+KeZ2W27eL1KaCUFWPBQ=uc22NeEJKkYJrTYBef4buKd33A@mail.gmail.com>
Message-ID: <CAMF+KeZ2W27eL1KaCUFWPBQ=uc22NeEJKkYJrTYBef4buKd33A@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de, 
	platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den m=C3=A5n 6 jan. 2025 kl 12:50 skrev Hans de Goede <hdegoede@redhat.com>=
:
>
> Hi,
>
> Sorry for the very slow reply.
>

Hi Hans, not to worry and appreciate that you take the time! I have
been in good and capable hands with several eager and helpful
reviewers who are helping to push me in the right direction :) I
acknowledge everything from your message but will respond to only
certain points below:

> > What exactly should they be named (any preference?)
>
> No preference for the naming, the firmware-attributes API just
> specifies how userspace can find out if something is
> an int/string/enumand valid values / range. Not naming of
> the attributes.
>

Now that I have had some time to get over jet lag and craziness from
the last few weeks, I think this has finally sunk in and I am with you
all on firmware-attributes :) I have decided to revert the naming a
bit on what I had most recently called "camera_lens_cover" to what
Samsung device users will be familiar with: "block_recording"; the
rest of the attributes within the enumeration type group will exist so
hopefully it will be pretty self-explanatory and also help to soothe
some of the "unexpected side effects" confusion. It will still report
SW_CAMERA_LENS_COVER to its own "Camera Lens Cover" input device, but
the firmware-attribute itself under samsung-galaxybook will be called
"block_recording".

> > Other notifications that I am wondering what the "right" way to handle
> > / using the right interface:
> >
> > - Are there better events to use for these which these devices are
> > reporting for "ACPI_NOTIFY_DEVICE_ON_TABLE" and
> > "ACPI_NOTIFY_DEVICE_OFF_TABLE" , i.e. some kind of standard
> > "switch"-like notification that the motion sensor in the device has
> > detected that it has been placed or lifted from a flat surface?
>
> The thinkpad_apci driver has /sys/bus/platform/devices/thinkpad_acpi/dytc=
_lapmode
> which will read 1 when the laptop thinks it is not on a table (and thus w=
ill
> limit max temperatures a bit to avoid someone getting a hot lap when
> actually having the laptop on their lap.
>
> I'm not aware of any other drivers having something similar. I do think
> that power-profiles-daemon checks the dytc_lapmode thing, so it might
> be good to have some standard interface for this, but that would need
> to be designed / decided upon .
>
> For v1 of your patch I would just dev_dbg() log these events and
> otherwise do nothing.
>

What I have landed on here is to forward along / generate acpi netlink
events against the platform driver name (samsung-galaxybook) for these
events, so for now users should be able to use acpid or similar
userspace tools if they really want to act on this, but otherwise
nothing else is being done by the driver. Please let me know if this
sounds like an ok approach or not and I can adjust accordingly. Also,
of course, if there is a different direction in the future where a
more formalized "userspace interface" for this is established, this
can be changed!

> > - When the battery charge control end threshold is reached, there is
> > an ACPI notification on this device as well that is the one I have
> > marked "ACPI_NOTIFY_BATTERY_STATE_CHANGED" -- the Samsung background
> > apps pop up a custom OSD that basically says something to the effect
> > that their "Battery saver is protecting the battery by stopping
> > charging" (can't remember the exact verbiage) and they change the
> > battery icon, but without doing anything else in my driver currently
> > the battery still reports state of "charging" even though it just sits
> > constantly at the percentage (and has the charging icon in GNOME etc).
> > I have seen the event come and go occasionally when I did not expect
> > it, but my working theory is that maybe it is if/when the battery
> > starts charging again if it dips too far below the target "end
> > threshold" and then notifies again when the threshold has been
> > reached. Armin also mentioned this before in a different mail; I guess
> > I would hope/expect there is an event or a function I could call to
> > have the state reflected correctly but I would not want that it
> > negatively impacts the normal behavior of charging the battery itself
> > (just that the state/icon would change would be ideal! as it functions
> > perfectly, it is just that the state and icon are not accurate).
>
> ATM there is no userspace API to communicate e.g. "charging stopped
> due to charge end threshold" and this is the first time I hear about
> us getting events from the hw for this.
>
> So for this one too I would say just dev_dbg() log the event and
> otherwise do nothing.
>
> We can always add an API later if we have an idea how userspace
> could / will use this.
>

Similar to above is where I landed for this one as well: what I have
done for now is forward along these notifications as acpi netlink
events on samsung-galaxybook, so users should be able to see and act
on them if they really want to, but otherwise they are completely
"new" / custom events that should not disturb anything (and as said
before, this can be changed later if/when any formalized userpace
interface is established for this kind of notification event).

> Regard,
>
> Hans
>
>

Thanks again and hopefully I will try to post v5 of this patch soon!

Best,

Joshua

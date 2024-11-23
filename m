Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C5E17C2
	for <platform-driver-x86@vger.kernel.org>; Sat, 23 Nov 2024 17:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732384719; cv=none; b=FUy8weALRAIUVg3oHhbSYGQyTOXSG2kk8cUFct5dYL07R13ogLJnzygCzlCiQI/gVU1bb3KJIvvSafrFeJMW4sKu56LzpN6ku9ZMkRlVWEZHe55B20wHahBaW6LaFtooQW4tuSl7pqrb36EtjSOq8pwRps4tA9bkscV+nbmJ9As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732384719; c=relaxed/simple;
	bh=/ZzlJWzz76IOoqI73LEBhFBE5T/f72YR/jyegorsr7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqLNKqceqXXVEMJdbWzvkLD7Lw04BYEIErZHI1m4kuo0GQCqp2o4vPoQNGVFPvWUBwgVnzDjTge0lB8EmwqOfztMuS6P04C0PKNi7TeaIs1sR7HCfoFxagpyazRpl16FEOov/IGlb8Jo7LS+vVntdH91Hr/GD9l7dusrp10ALIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a763f45bb6so12284195ab.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 Nov 2024 09:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732384717; x=1732989517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZzlJWzz76IOoqI73LEBhFBE5T/f72YR/jyegorsr7U=;
        b=om4Ryu/OhYweTrOph4ZmKjHqDp3YE3kIjE2unMFYet1sF68j97AE96JK78aI2VG5if
         mDQNQXIJz48QBgVoh+GMVUnYmtVLvgDvx0rN2TH3BV06SH4gLudDHgw+lKmw0Mh8amRy
         nqTUaeHnW/K6trQ1CRchcku5fbFRifWQA09d4axil6LxXhiX58L9KYoHasns+APojybo
         oqh0ZMVqxpJ2bBTDizJg1g06EveBVfvaiijiDfDGfCiW9TSTgYaLK4WEQSEHra6qTxCh
         MWaImo/qvbABXf2oApL0gxZoY6nQtAQ4cqXZdm/WVLpwZ5d5IE9eoDfKSqYwHj6VGjSE
         M/iw==
X-Forwarded-Encrypted: i=1; AJvYcCVmtEW90cdLtC31nTmZAFlPlp7ZdaDYcnQGgWHwcqA8S+xQX7trObil3uyGu3VbT6QuK1CWbakXm3hU+p6J9lqtC+wi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6vr5Gc/nYmuOE6qdxwQNvniBg+QlmmYwfzjbjWqx6AysqZ4zp
	Dsw6LzXZWJVHh22N598wLYesPxBNENowalQHCHCkrClyE3e2sfTIjqtAw09e
X-Gm-Gg: ASbGncs2L+FhvCtC8gvmwoOLYObCkjB9wSrv1eHKWNS6fqEBlk6tnf9J+cqh8GeDbMP
	Tbzzlnrw2EZ5ocMt5fWVP/hXroHOddpn0Sen5f+6/EeB2uWK1sW1VyeNwGjUCA3vu2/3tGyK5oN
	ITOc4/T7X7neYtdlZOdLrs+keEWpDsLX4EiNO33/PbCHRw7d1f0T1vaqUj/hVO6TtdbY1UoIjra
	l+0R/xx4zObiLw09Xu37y337JozJ+WoqeRRSbq9bV0yGO5UreAmp5NpFufVkJjtLjGemb4wFSa8
	68D0Gp3J3mQSyPE=
X-Google-Smtp-Source: AGHT+IEFOw/261YvlwuKAKc7UqXDDHHCnu6QZgIxJ+DtqJCqt64YfBzkHiMdk4yDZBkdmka0JGtYiA==
X-Received: by 2002:a05:6e02:1a03:b0:3a7:6f5a:e5ce with SMTP id e9e14a558f8ab-3a79acfd53emr88302115ab.3.1732384717225;
        Sat, 23 Nov 2024 09:58:37 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e1cfe59c91sm1223334173.76.2024.11.23.09.58.36
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Nov 2024 09:58:36 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-83ab694ebe5so101753339f.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 Nov 2024 09:58:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtETYVWUEFEOUq8I6W+2oyK6iy/b/6Lr5LXfZFa1zfjy+L0ApNOGs0oAdWNSUfUbZQ39jMldmE2bmQgtwdOOHJvIAQ@vger.kernel.org
X-Received: by 2002:a05:6602:1401:b0:835:45f9:c2ee with SMTP id
 ca18e2360f4ac-83ecdc6176cmr719100439f.4.1732384716517; Sat, 23 Nov 2024
 09:58:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <fd4a30e0-b5bb-47d7-8173-312417dce215@gmx.de> <CAMF+KeZkqwnBNT4vVNLEC03zZqSTSAE-Z=8j9ZLACf3yBeun8A@mail.gmail.com>
 <qsdbzbvpwlrnx2sqhrjfg3rukbm3z5gjkyjwlwoc3jnd3vre36@72py3mfwwsse>
In-Reply-To: <qsdbzbvpwlrnx2sqhrjfg3rukbm3z5gjkyjwlwoc3jnd3vre36@72py3mfwwsse>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Sat, 23 Nov 2024 18:58:25 +0100
X-Gmail-Original-Message-ID: <CAMF+KeYGCZuc5DSCf4S+oZZgp5E4hwowJ+HqOy=ijjPZwv+zpQ@mail.gmail.com>
Message-ID: <CAMF+KeYGCZuc5DSCf4S+oZZgp5E4hwowJ+HqOy=ijjPZwv+zpQ@mail.gmail.com>
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Kurt Borja <kuurtb@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Den fre 22 nov. 2024 kl 21:25 skrev Kurt Borja <kuurtb@gmail.com>:
> If there is a suitable platform device, your platform driver already has
> an acpi_match_table, thus you can get your acpi_device with
> ACPI_COMPANION or your handler with ACPI_HANDLER. Check [1] for an
> example.

Thank you Kurt! I looked into this and I think it makes more sense to
me now. Also it seems the existing driver ideapad-laptop is also quite
similar to this pattern and potentially a good reference, as well.

One thing more that I have found while looking at it from this
perspective now: in addition to the acpi_driver stuff, the driver is
also creating and registering a totally new platform_device and that
is currently the "interface" I have created (via sysfs) to control
some of the settings (e.g. "start_on_lid_open" etc). After an initial
local draft of the changes, it became apparent to me that even this
extra platform_device is not needed, and everything can work from the
existing ACPI device ID-based platform device (SAM0429:00, etc).

The downside to this is that users with these devices will not have a
fixed name for controlling some of these ACPI settings via sysfs
attributes on the device (depending on which model, they will have a
different platform device name). For example, like this (using
existing platform_device):

cat /sys/devices/platform/SAM0429\:00/start_on_lid_open

Instead of this (creating new platform_device like currently exists in
the code):

cat /sys/devices/platform/samsung-galaxybook/start_on_lid_open

I guess to me having this be based on ACPI Device ID and differing per
device feels "less nice" compared to having a nice "user friendly"
path that feels a bit more obvious. Is it preferred to just use the
existing platform_device based on the ACPI device ID instead of
creating a new "virtual" platform_device with a nicer name for
purposes like settings sysfs attributes be more "user friendly" like
this?

Another alternative is that I could move these kind of sysfs
attributes to driver attributes instead; then if I am guessing
correctly then it would be like this:

cat /sys/bus/platform/drivers/samsung-galaxybook/start_on_lid_open

But then I do not know if having this kind of sysfs attribute (which
actually will query and write values to the device itself using ACPI
methods) feel correct as "driver" attributes ? Maybe it does not
matter and I am just over thinking it :)

Any preference on these two questions? Again, to recap:
1) Yes or no to create new platform_device even though one already
exists with the ACPI device ID as it's name?
2) If using existing platform_device, should these kind of sysfs
attributes be under the dynamic device ID-based platform_device or is
it ok / make sense to move them to driver attributes?

> [...]

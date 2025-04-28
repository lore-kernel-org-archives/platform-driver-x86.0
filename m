Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB926982E
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849462; cv=none; b=TjPEeofkTTwfR9GRu6pXM+fBqtXfPgwdmjos2q7xV1COsumOG7IOQ8d90phIObvFyim+iZ/H9cwi4wUy/3M0Q36SHhzUDjfUhNPRvCq66sgxu8bpUepoBsu9LVsfPY8EPVOyxQobVYFdF0WUT7SumLF8Ufu23Q6NphjytGKU8BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849462; c=relaxed/simple;
	bh=3h2EMGfvu+UctStWx0bIwV5H/Jn0gdVbSF2DccNcs84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiSqMWw6CZQMKmFyZmGg8aWWucsjc8BRy/Is2N5VdyNSplLR7TwYE7huG+Vw7cqSqld7wO4zOio9IGi7vSuDQi7uuPFgIaEXpJPTIUIeu16//N2mwmIcIfLPii/IYcinNzDenD2uQWGY/xSddk5ZjIxDu7Yvxy1uQl40V+sixYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c+l6hOth; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c+l6hOth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745849457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+uPdzRwnIP87DAfoRjnEpqTaAiojdHq3g26uxoE7Gc=;
	b=c+l6hOthoA062FLLkBU5WPLzG7LQv7ySeq44TMpjFSwC+dPiFNTE4Gub9mytoXYy8u1rAA
	Bpsx06YhZhd+rzfZl8McZYbZBk0stqmxn6wTHIgr5AVr2AwGLJGk41SeNqLz4uGG2TEMuj
	AaMtbhoFHDrTcOCTiQWrw9qaQ3j6zcM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-8hyoKenUOKKyB2A4wOU8HQ-1; Mon, 28 Apr 2025 10:10:55 -0400
X-MC-Unique: 8hyoKenUOKKyB2A4wOU8HQ-1
X-Mimecast-MFC-AGG-ID: 8hyoKenUOKKyB2A4wOU8HQ_1745849454
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ace942ab877so172087166b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 07:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849454; x=1746454254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+uPdzRwnIP87DAfoRjnEpqTaAiojdHq3g26uxoE7Gc=;
        b=siz4Qqnes7ppZw3sYRcxK0nISgveWR2IbgilIj7kuNBR58TQ+w09KYJHyZLbTzpEJ2
         tc97s/n8Djf/TP/1c+WKCIbabENylbOdM9h5AM0xLW6nKghGZENgBLiMF0Ec1xZhSudy
         Mrfe8DUtqxKjw5fwOOJ6Xq91le6J1424DodQ9dWfqdbM98cFvbdlt/iou3uKDvmVH2VB
         kcEs5D+4/ojChdjn7YyBhGWJyct3UvKjHLbokCaP7E6mE6T5NnxbCQvIleiT0gSZjaSi
         PkP0ZpNsQEIt4Od9rDBIUfZY1uarm6/Vbdn96tacgEMHmPE7MO9Tem82uzbh3PGN0K8M
         pTzA==
X-Forwarded-Encrypted: i=1; AJvYcCXmm58oR1rfUrqLvbK5wviYfKGhMTq8uTCkg/Cwtj+wwN5+prmX0GeLzTe2ibkTnQ095B1M5nBnaa+q9yPuv0NzaFtT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxce7p/HWP9v/L+73b1GlLaS8Sa986iwJXiqO5zTbtnUjyVi0VX
	ollTyGLXysAhUUUM9dzauI4YqkI3aK8fyNQzLq8Xcbvvx82AZ7maLhEsFU2MH/NArzuMOrt4gys
	quD4PnkVbAiPAFmZ4an7MP2rNL9+d291VYIBtSakWqwVMILC7rZIEq7mJ4H2+AaW4GsVwzS0=
X-Gm-Gg: ASbGncsqSoBF1si+mxXSlDvEmu/IH6N9Rk7GgVwtg3BU2l/7Tw6PQe2I5HcZtB2iI6x
	DcI7R7fnpRJeBaye2KveIClaUna+PTa8nBHyq9JI7poqM90bnrQuBqUUeKJ+o06b60jPAM9wF53
	AoM1xp2fqrblPKu6jFNn6wh//9VNdKBdMtb4TWFZCi4AohLT4GhMwSwrapYr78V15Z+r3GKKq2H
	qDXMbbFBiAtbvU4iY/8kNVAZLr9YDPtL0Fjsu89Gm115CFGZ8jCrA8HVvaRXg4RrXYadqjRoaNk
	L5E2s5oM1FypgQ0=
X-Received: by 2002:a17:907:9449:b0:ace:6fa7:5ed3 with SMTP id a640c23a62f3a-ace848c0470mr711016266b.4.1745849454252;
        Mon, 28 Apr 2025 07:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDhqLGdlz5ExTdegQGYB8SKbnk9MuRrjtYF3bvcdYMyl0xaJNQdZAaKvtae1celGjHMZAYPg==
X-Received: by 2002:a17:907:9449:b0:ace:6fa7:5ed3 with SMTP id a640c23a62f3a-ace848c0470mr711012366b.4.1745849453831;
        Mon, 28 Apr 2025 07:10:53 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfb35bsm633212366b.100.2025.04.28.07.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:10:53 -0700 (PDT)
Message-ID: <98ffacc8-d13a-49b6-bcfd-f3cc35224b79@redhat.com>
Date: Mon, 28 Apr 2025 16:10:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK
 with META + L
To: Mario Limonciello <superm1@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Armin Wolf <W_Armin@gmx.de>
References: <20250425162949.2021325-1-superm1@kernel.org>
 <aAyWFI+o/kU9hDVs@duo.ucw.cz>
 <b4bc07aa-e4b5-4a2a-a4ad-91c1e5071f00@kernel.org>
 <aA0o2SWGtd/iMYM2@duo.ucw.cz>
 <db4dfc85-ce8b-4922-9558-670c3bb6eff2@kernel.org>
 <aA3KXNCKKH17mb+a@duo.ucw.cz>
 <63fbf7e7-8d61-4942-b401-51366705252b@kernel.org>
 <7tnn7sa654c3irqxprnqgbxawl6pnvuuonps3t5qkhso3h6fp6@fc3ph7fkukgm>
 <owigkmidrmavvcdewxx3fvqyp4klvchklgwbtpzncqiado4kwb@akuzxqxp5jpm>
 <a7e82a84-2610-4132-90a8-42b371f57fb0@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a7e82a84-2610-4132-90a8-42b371f57fb0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mario,

On 28-Apr-25 15:50, Mario Limonciello wrote:
> On 4/28/2025 12:51 AM, Dmitry Torokhov wrote:
>> On Sun, Apr 27, 2025 at 10:30:24PM -0700, Dmitry Torokhov wrote:
>>> Apologies for extended absence...
>>>
>>> On Sun, Apr 27, 2025 at 07:15:31AM -0500, Mario Limonciello wrote:
>>>>
>>>>
>>>> On 4/27/25 01:10, Pavel Machek wrote:
>>>>> Hi!
>>>>>
>>>>>>>>>> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
>>>>>>>>>> to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
>>>>>>>>>> to lock the screen. Modern hardware [2] also sends this sequence of
>>>>>>>>>> events for keys with a silkscreen for screen lock.
>>>>>>>>>>
>>>>>>>>>> Introduced a new Kconfig option that will change KEY_SCREENLOCK when
>>>>>>>>>> emitted by driver to META + L.
>>>>>>>>>
>>>>>>>>> Fix gnome and kde, do not break kernel...
>>>>>>>>
>>>>>>>> I'm sorry; fix them to do what exactly?  Switch to KEY_SCREENLOCK?
>>>>>>>>
>>>>>>>> That's going to break modern hardware lockscreen keys.  They've all
>>>>>>>> obviously moved to META+L because that's what hardware today uses.
>>>
>>> Vendors do all kind of weird things. They want to ship their
>>> peripherals here and now and they do not care of shortcuts will change a
>>> few years down the road.
>>>
>>> FWIW there are plenty of external keyboards that use KEY_SCREENLOCK and
>>> do not emit any shortcurts. Anything that is "Woks with Chromebooks"
>>> will use KEY_SCREENLOCK.
>>>
>>>
>>>>>>>
>>>>>>> Gnome / KDE should accept either META+L _or_ KEY_SCREENLOCK to do the
>>>>>>> screen locking, no?
>>>
>>> KDE by default recognizes Meta+L combination (which used to be
>>> Alt+Ctrl+L), Screensaver key, and allows users to define their custom
>>> shortcuts.
>>>
>>> I also wonder how many other DEs beside Gnome do not recognize
>>> KEY_SCREENLOCK.
>>
>> So I poked around Gnome a bit. According to the gnome-settings-daemon
>> source code KEY_SCREENLOCK should be recognized. It is set up as
>> "screensaver-static" key which is hidden and shoudl not be changed by
>> user:
>>
>> https://github.com/GNOME/gnome-settings-daemon/blob/master/data/org.gnome.settings-daemon.plugins.media-keys.gschema.xml.in#L504
>>
>>      <key name="screensaver-static" type="as">
>>        <default>['XF86ScreenSaver']</default>
>>        <summary>Lock screen</summary>
>>        <description>Static binding to lock the screen.</description>
>>      </key>
>>
>>
>>
>>>
>>>>>>
>>>>>> This was actually the first path I looked down before I even started the
>>>>>> kernel patch direction for this problem.
>>>>>>
>>>>>> GNOME doesn't support assigning more than one shortcut key for an action.
>>
>> It sure does even if it is not shown in UI. Poke around with
>> dconf-editor and look in /org/gnome/settings-daemon/plugins/media-keys/
>> and you will see plenty of "*-static" keys with multiple
>> keycodes/shortcuts assigned.
>>
>> "touchpad-toggle-static" - ['XF86TouchpadToggle', '<Ctrl><Super>XF86TouchpadToggle']
>> "rotate-video-lock-static" - ['<Super>o', 'XF86RotationLockToggle']
>>
>> and so on...
>>
>> Maybe Gnome broke screen lock key in recent release?
>>
>> Thanks.
>>
> 
> Thanks for your feedback and looking into what GNOME is doing.  It sure /sounds/ like this should have worked with no kernel changes and GNOME has a bug with the lock screen key.

My guess is that maybe at some point the lock-key (combo) handling has moved from
gnome-settings-daemon into mutter and maybe things broke at that point ?
 
> I'll abandon the kernel series.

Agreed, the GNOME bug needs to be fixed regardless of AMD PMF use.

Regards,

Hans



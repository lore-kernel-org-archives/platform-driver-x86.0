Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5C5280308
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Nov 2025 04:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762144152; cv=none; b=i/TeQy2oY3pJefHH6YwJfszYcIlhsOsumyJUqIClKpc2ihuQvzgo/HrK5ZtRWM9hwxaL6f2ulJcDZK2eL3UBm6MppCBN5cQiBi2aY9c34GWiLtyinK7j6fb4RLEF6QxjGPOB8JNhxJa7Z0nh9LNy7hVmkc8QO1Zy3js/PX1wR1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762144152; c=relaxed/simple;
	bh=BRyq2xvMBfZJNr2slPuwGEUwckfTGKdksrZ8m6uaT8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HeqvgShhxetOWSH+MGwKjwxPOLDFwHi8IhH0xv/2z/eqeFpRXBn+10kfql5gUdcPwNRTxYsZzsCObVvNbtaoc8rnhdYgPbJyiRiss0C5VvZr1BMGyIkmxNbyJakgnFbanEcaj1NK+q3qZK5jCGLlIDotwf2dZoQZkB/D2l4F5s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+mZZQll; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+mZZQll"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29555415c5fso20506745ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 02 Nov 2025 20:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762144149; x=1762748949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zejBsmGw8Dammq1NbHzRkUXu6Tc3VRpWHGPbCKlc5tw=;
        b=Z+mZZQllbVd1w80ndj33spWHb3PKU04g054vtrTNuA8mQV8iG9Nej6G+4PdgJ/EmCG
         L5SNo9Pi7toyodkQsLsPl89RHC4EjPMIc2ZGP/WzMzMPyYYgX5zEVC9JubSfCTtaJ29X
         EbR8JWU9+ojC10/JUfSqdc+T4Tf7zMlCf4uN9aR8I8drUfl7tu7jBpNLJfEk83mQB1l1
         10rmv6F10LTNvgaeOknWC+xuQOwCS3ao2HkBlvgQVstVm2Ed1fiHpMDvPBZ2DqHdqoMv
         TbRllIuara4v5xR97QrQ1yTTpyaNNw6vHYy1Hc8Wt7Utv2cJ7+xDqQNdlIyMh81UKR+N
         Augw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762144149; x=1762748949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zejBsmGw8Dammq1NbHzRkUXu6Tc3VRpWHGPbCKlc5tw=;
        b=WaWXdHGzuPz/ybPA2gHr6IjeWgz9C3FJe5fO6Aq4QsETL5OcrIyIB6exhHBr2Bqu6X
         etBUfyDixrJTlU0nRhQ3eWsY9y6vVi8DlHflEjOM5uCWsJlcrHqGQP26G0T9GrOywSXu
         DPjRHxTJ4mtoMCZJYJABePX40Zk+5L0XyZ65xOnic33F470uZKsq2ePDhxICC7sotF++
         HiOpv188xgjGXhsS+wY9mzrg8jV3Qc4VnLuaB3pwzptUqlQTjHpnJwa/9gwFZwKhPlS4
         bhR44MXXp1jfTfU2h/iT73MB5DjB98F9TwNYBlSjXcv4nckfis9FlaKwA0GtJL3i+b9+
         SV+w==
X-Forwarded-Encrypted: i=1; AJvYcCWjcE63p9JtUk79BxvQZaVgfOjLWOUA3mrCZDsTDNfod+nuN9IzMacm/DqwiAFCwQC95Q4ff31er5tX/0AoE+UEucmr@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0q0aL8P7huZILKBzekoHlIf7gYPT5Co5jBbvry4xH0hJ/6OX
	Ts7lsbYUsMqIKJahWgDHpzA3Nsnjnfv32zIgHZr0UHdD8e80R6X7gwNqD34k6Cpi
X-Gm-Gg: ASbGncv/rlNWo+d7ZJLHN28J3Mb8RmdnB6m7LMEgc8fQGVZhUtnXKN63yVfzRF3il84
	vXp1VLnDuaTWiCHy8mNZcPYMvN3s+DOJKb5oGt+Uv0rRpIadAx3ARJtwLkisbS0Fkn9pmWqBCzd
	XaWge9HtVGeGEQwJa7d1hz9tPsmxGSS8sj+1XbGLrzAMDpjCOlo+YbIaRPfXgq8clzP12KfHn2D
	U/GFtxIl7dBTnehSh4k3G+Uam8g+mAYSk7ertQlo2FieMVe3VecUYvcS1mHybPuABv0hxWsIQJa
	fTIJ44m92mhqQLVBFeDFDgeu2uBp7FwaaZBF6ffWuDgdQo+AtMyjXYUwZzTpsnL8EZgrBe1VNs6
	iWJgmdSLTh4NK/315JlNSS7zqjqH+w9rMe6UUHtkw7k18JMImOYO1gS4O3JuuYtd18rAtf5hRQx
	3vxC1k2CsdQ/A7LYF0wEDqM5LjvK5Sm4m+yznyPwriqPuumGdAI0AxON9o
X-Google-Smtp-Source: AGHT+IFMAMIRr2XRxTxO6CYjUyJFceUddY16xeDxgm+N4RkpDVMPqTEsA7hTMjJvGq6jveVSi+he1Q==
X-Received: by 2002:a17:903:32cb:b0:295:f1f:65f with SMTP id d9443c01a7336-2951a4debf5mr127576615ad.31.1762144148913;
        Sun, 02 Nov 2025 20:29:08 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268cbad5sm103047725ad.45.2025.11.02.20.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 20:29:08 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	kernel test robot <lkp@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple kbd led handlers
Date: Sun,  2 Nov 2025 20:28:48 -0800
Message-ID: <20251103042848.9302-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
References: <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>On Fri, 31 Oct 2025 at 09:27, Jiri Kosina <jikos@kernel.org> wrote:
>>
>> On Thu, 23 Oct 2025, Antheas Kapenekakis wrote:
>>
>> > >   1589
>> > >   1590  static void kbd_led_update_all(struct work_struct *work)
>> > >   1591  {
>> > >   1592          enum led_brightness value;
>> > >   1593          struct asus_wmi *asus;
>> > >   1594          bool registered, notify;
>> > >   1595          int ret;
>> >                               /\ value should have been an int and
>> > placed here. It can take the value -1 hence the check
>>
>> Thanks, that needs to be fixed before the final merge.
>>
>> > Are there any other comments on the series?
>> >
>> > The only issue I am aware of is that Denis identified a bug in asusd
>> > (asusctl userspace program daemon) in certain Asus G14/G16 laptops
>> > that cause laptop keys to become sticky, I have had users also report
>> > that bug in previous versions of the series. WIthout asusd running,
>> > keyboards work fine incl. with brightness control (did not work
>> > before). Given it will take two months for this to reach mainline, I
>> > think it is a fair amount of time to address the bug.
>>
>> One thing that is not clear to me about this -- is this causing a visible
>> user-space behavior regression before vs. after the patchset with asusctl?
>>
>> If so, I am afraid this needs to be root-caused and fixed before the set
>> can be considered for inclusion.

>Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices on
>ROG") adds HID_QUIRK_INPUT_PER_APP and the extra devices seem to
>confuse asusd. Since the devices are the same as with hid-asus not
>loaded, it is specific to that program.
>
>
Hi Antheas.

While you have previously expressed to me directly that you wish InputPlumber
didn't exist, it still very much does, in fact, exist. I also know that you are
explicitly aware that InputPlumber is a consumer of this interface, so your
comment that asusctl is the only affected program is something you know to be
false. This is not even the first time you have renamed an input device that
you knew InputPlumber was a consumer of without notifying me[1].

I can't abide you outright lying to the maintainers here and I'm sick and tired
of having to watch your every move on the LKML. Either become a good citizen of
kernel maintenance, or get out of it.

Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices on ROG")
Nacked-By: Derek J. Clark <derekjohn.clark@gmail.com>

- Derek

[1] https://lore.kernel.org/linux-input/Z74vZD7ZtKBTDlwy@google.com/

>We can delay that patch until Denis who took over maintenance of the
>program can have a deeper look. I will still keep the last part of
>that patch that skips the input check, because that causes errors in
>devices that do not create an input device (e.g., lightbar).
>
>Antheas


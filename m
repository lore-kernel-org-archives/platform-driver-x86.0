Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7E618872A;
	Mon, 15 Jun 2026 21:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557249; cv=none; b=ERWvHweK2viQJ+rmO5DgeJXCKeNqhPMhHFoKnQaJOPG3E53YMjnQT6SuOqivLEjPaaly7ReQ6/sU6jS7PtrUvVStDBESaizZFASWO512KYatK92vjkr6aEsGar3lMPYBbm+mDvtpyzperkIB6MRFfbBVgZfz98r/Gzm9JXguhew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557249; c=relaxed/simple;
	bh=Iacp3KBK2DhcxKjLjS91HdZ/7O4PX3KZUXrjlZK49CA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VR3kudMPw+4d7Iwa+XwTsUPhM7chwkH8tncNWlcTb/GqFqpZTqGJo7FnEU9tLVfCyekrRknZOFcVzN5yHZjwryFrP/9m5+YtI8LUjrVUlGgPrlMtc4kE4ZU/b6P+BcuNgUpKTzW2r3Y1/fT22kqhtVKNlZ5c+7azjU64c5Q7mB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=mKgnfh6P; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZA3V8spp; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="mKgnfh6P";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZA3V8spp"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 605817A0149;
	Mon, 15 Jun 2026 17:00:47 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 15 Jun 2026 17:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781557247;
	 x=1781643647; bh=kVMZ+W8oyVNjIfQj1Fu07tz3unDxBxi6GHF+khODvl8=; b=
	mKgnfh6PqRTKWIrnRt0IyYV+h5S28qd1e7X5+il7gyRQQ++YLAvwWcm/ktLnJeJ5
	CtAYvfj3UveHmuaKxUznip7Or5JaSF5+8beflxq1UlofQnwYU1YW81/+GFzh34NM
	wQWM2i0T5enD5K/eH8xCCk98PIT38mhc5td17MRyUgvoCjE05SlhNaO9HtgYPvqH
	lBpHfw6tpndYbkk7k0y8urvn7QV2N10r4wyRtlsuQ8rnFJOMMT3bB/jTldqpbWc+
	VaVuKxz39/zQxuxPPsILcdUgcFMVofoTMzz1EAXxYjTZT11lloJMPSBROUuq8mqd
	05xZSMDEmp4w1Ejno7vthA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781557247; x=
	1781643647; bh=kVMZ+W8oyVNjIfQj1Fu07tz3unDxBxi6GHF+khODvl8=; b=Z
	A3V8sppXt3bjOUzFWZGAVI5VRASA0ei9wfU13ZZB4sggwod1HSuzknNX6ThpSGoC
	T2OHj9zC6fXwWwITh+yTfKl7ToswQJEcFQ/G/3bX0uejMAAte8jkPo5UnR1GzYUS
	Pj+z4tAX+4/W4EwxqBOZ7vrkbxEupcHNGgBeb6CV6z6wW4ZDELQGwG4Lp23icDxi
	ebao6MffPgwWbmJzMxnlN4991SJLwW9emCh6bh3/PohPNCfn5BLjzl05Sf8Nzb8w
	2Ds5U4HJCdIgk+88SwDBecyQhNLupXfHmbAcI+0hEX9HwI+r9XQVSoT6oYQtwYrT
	ylupPD+JNAfBQxrQAmFNw==
X-ME-Sender: <xms:_mcwakiNh9dBGye-ZdO2FXSt5CL75qjJ9M5s9OvH1sDFcFVOtmKf1Q>
    <xme:_mcwan2rlBd7XmveP2pCjMKDAshdvvlhWc1TV2nKucFDxYVOyoN1FD0PHtOEfmIJK
    cbIfDnTsWg_pcCrkAaqOIileqJOy0_16PTVHUfRyx1HMVXaUvnw3sU>
X-ME-Proxy-Cause: dmFkZTFlZptzfa/HAxjlzORCuzp1HF7p7WdQF5zp1E8+UL2UdSdEqcQKnjcgkSHdzqVrCJ
    gRKtCL7tlIZ68/CEW6CqDHZeAHMGdUx8uAKdjCPOaeU+mLNrq81n2cE2yVLdOjQsytAzMt
    JmwQBz+PM9hA5LnyH+lOVsOipDl52v+qQXtJrBZGRHQScBirvU+3FSeo8zC+uGeC4nAkmg
    +hEjs4H4hFHzhtDCIdX7mhrZiDeISAR7VRq6AemNHNhEIIozEDzsVihBMDYmjC/b32Q7lt
    3wq7Lg/eJCxn5lY8cKem/6EExfIiMYV/UdlU9VKCJv3Lm1HRX6j4j2XRODzxTYwvWsx7Rz
    HmCbptK1ocBnq6KmmBzMkxuNikx6oY5IIbxyM3WFocLTk2hJmI2A2TTnssrBEg490UToa0
    Lqfg+2kkFMoJzEu7yvwwIlvgJGzMzL/KbWHsQqmoD+Ebr0JOIYnbGZaQA1MBF62ujeiB3o
    Zctt8C1/S++URp2cJW+dFmgagR3TeddM54NA9XdOIUDUFsKqnOY/Fo94VWPdfdUF7cjcJ+
    g09qZnuIfZkP4FnwGgAsBgrv9E6GqJWiFo7+jEQ4US01i8xFgQEhj9d6d17RIxr0YYokWV
    6bAUWxyPz+qPOIy6oNtoeKIS9TX2ZAGLzR69Zv5BKsnEjf0F1JEFmgMPQ+hw
X-ME-Proxy: <xmx:_mcwavTsKsvrk8-_KyB-Ye8SXoinDVI1nElYJa-mA6qfxGW-GTGl8A>
    <xmx:_mcwajX8zU0VqIRKuB2cy1e1eleFELnrNoeZkp2t7ZYjEdg8EX2sVg>
    <xmx:_mcwaofVRS8LL77TLFNAuHwaRu7XFBC-MJObWU7v2pFhjsKvary1kA>
    <xmx:_mcwavLpk9Z9hXJFnO7TpDcOiS87z6jVeFjGmzRFFKOzvzWj7eyRbA>
    <xmx:_2cwavmuwRsNYZMoxETdgYqabE0bSuWsvfjlz46YsYBZXgfvAvY3_b52>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4315D182007E; Mon, 15 Jun 2026 17:00:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AiNCL5RzVN0N
Date: Mon, 15 Jun 2026 23:00:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Armin Wolf" <W_Armin@gmx.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Shuangpeng Bai" <shuangpeng.kernel@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <c2445ace-95af-402d-865b-b9451e92de88@app.fastmail.com>
In-Reply-To: <5ddd81bd-b7eb-4c3f-b222-4fa3b4768d5b@gmx.de>
References: <178144969601.60470.13396800403157907003@gmail.com>
 <543e7c0f-ae4b-49e4-8bdf-6bf7d0dc4775@gmx.de>
 <2026061525-dayroom-backspace-4273@gregkh>
 <5ddd81bd-b7eb-4c3f-b222-4fa3b4768d5b@gmx.de>
Subject: Re: [BUG] KASAN: slab-use-after-free in _copy_to_user from
 platform/x86/dell-smbios-wmi
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jun 15, 2026, at 22:21, Armin Wolf wrote:
> Am 15.06.26 um 15:30 schrieb gregkh@linuxfoundation.org:
>
> Its a "unbind" operation, either from sysfs or started by the WMI driver core.
>
> I do not think that this has something to do with the module reference counter,

The misc_device reference count. The module reference count is
protected by the wmi_driver object.

> because the UAF is triggered by the device state container being freed:
>
> 1. devm_kzalloc() + misc_register()
> 2. open(), uses data previously allocated with devm_kzalloc()
> 3. unbind, misc_unregister() + freeing of state container data.
> 4. read(), access to already freed state container data.
>
> I assume that misc_unregister() does not prevent read(), write() and ioctl()
> on already opened file descriptors? If yes then i think a RW-lock inside the
> driver would be necessary to synchronize the removal of the misc device with
> any outstanding read()/ioctl() operations.

A get_device() in ->open() should prevent the misc_device from
going away during read() and ioctl(). You need to put_device() in
->release() then.

If the driver->probe() function takes a reference on the wmi_device,
that prevents it from going away underneath the misc_device.

      Arnd

Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B3438F633
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759969; cv=pass; b=nJsdmjmLAAkiHhjGUKSwMJVNbnLVIdtEbluB0DrzOxO4JJol0DSsPUL3b0T9dP9GBWUvG53cGgGJVSfXzZ2bAOwlbNc1ZksMqRq3EN/1GAQVrMkr4q8XdaIvf3vFkNH/IcyUX6/JrQ3CFI7RFjLLvwIsS7apNfQvdubA/Vfbf6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759969; c=relaxed/simple;
	bh=ewqqiCfh0TRZKhXX1gDHk4TFYmCPl4ntkxHInIAMpdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKIK6fu5ACFD7anyz6Kcj/fCYDiCT/4XmlTyvS3C/KLva2kiRTzF9yI1XpP6O8nKymsyP3jjOlEYHUo6bITPNru+V7V8KSG7Ttgc6btc9OlNVA5oqZYtTyyyY//nCT2w0SuRlFIX0x47bhRhAHMAlPZSg6KW4CCAk7qkKYraFFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJfUOO4o; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJfUOO4o"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a115c08b0bso9218831fa.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 08:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787759966; cv=none;
        d=google.com; s=arc-20260327;
        b=qZk2P/pccqfI8idSNbQ+FhvSOG/08jrCsck10IUxwhgTDUepW/ud3xNMjVaRa9DJu+
         inAC+S+vSIyGuli9PLYPC8y+9aW0k3jN+1VTMRsFfUQUD81H9xMEYshG23V33zy+3sN7
         xQMD5fUOv/zFWJszoc75ok7lWyTWPIZg4ZmusneOECb4ayQyg2YLokq60iyIB5Te6bEt
         e0AZBrcFXT+a+VYG5Cl3c8PHfkPRrCDDgCdeq/J/IrQCredRspO7E3zq+L9lC+FAxlzb
         H7XOosR8w/lPVGZsVtTD2YmyA1049ijW645mZxJc5f3dAZChIA5OUPHAwCowcHc9tVEX
         KT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ij7y7rUK1s0vtd21AVgQn2YAV8w4d4klp1Ce1rOEqkE=;
        fh=PITwvsLaIjHlISYI2F9xBcxMCu1hfi2NSjsKTBPLtno=;
        b=M2EOweLtKDUpE5zzi8UhfnD8XmqMaAs7B/+7eIbwhls/YPub55giLdoDoZS92gnxkX
         AcqkCJ9izmeQz+zyqs4MKpHP5ni6LkUUo+G1rfP52tP3w0aV093QR+M2v+OkHvhmswvp
         rHjKdo8OniMyLch5xB92LwVNcBdbG8p4DJ4Y56fQNlTsx+yuAlROIAzKOJNssNs49ZPl
         FFdSqoVJ8sTg1UPmpibwDZOUoXvVfI7vAZUjg4J5NZ6VvA9ZA8sx7UWd34ehz43SsQAH
         RnVpUbD2KBR6bm8OnMa8INbEpq3bTLt3xBUF+XduoAHJjb3sS7ZsNztyklGqu9PnsLTt
         wBGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787759966; x=1788364766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ij7y7rUK1s0vtd21AVgQn2YAV8w4d4klp1Ce1rOEqkE=;
        b=VJfUOO4oMmbzHfm4bRfyNxaRP1XIomAUCTlCrrLhDuURDnfSYdLU21ZfLjGxWzP9bm
         xpj17PL8yXsd7fxv8MakB4so3Bfi/N4iKi6zjS4GVCwVK6sbKx15A4IDIyJoCWDg4gjv
         Xtz1QzqnRQv67+nf+Atp66W/sFWlWXlB1wY/wHyxI1nh1Ur+mCWQFIVU8skvXMP4ZuzH
         jDhUd1BdkhXeAX3u8gsKK4hJfna9Wede4RKJkMMiW1Y2QufjcMTBJJWCMR8uO73QalUK
         iBjatzWr9CVpcQZnSbXFBirwJwKcn++vMtQe2odS/UmQR9HpqfhTMZd02cCvYO40LQpK
         Np7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787759966; x=1788364766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ij7y7rUK1s0vtd21AVgQn2YAV8w4d4klp1Ce1rOEqkE=;
        b=aHwt8Pg6NfuNPfEkxVYoBaMy/0cirDpcCYcmq0WOmEvp4U3GXvDkJ54I6mkL1RIUZt
         hyMyCTn6ghQpu5OEzfhM9QTv57Oa+wp7fwnT9vDI1Qn704TBIq0oOxXTvVZ2+HBaDrKg
         /Ds5qYrVjpludS95rYdZnoUzk8GtOVdtOVNowUhdocjmMiqFN2fww36gjn+nkBwCz3EE
         lGEh5u6T6DFpG3T5RlTscJQoiOi9kVoMC4/hB8zqpMgHL5apx8d7FfQsDJ5OUeFrnK8S
         ROyqwWc6IyR2vEFee3kI1fD5LwYJoaeF07nnFSpGNHJlZmBvUFu0RJ16hYw6D1MT4y5+
         EGJQ==
X-Gm-Message-State: AFuF++lm+ylmK3yhwk8Dh34CUTGa/uydbJaq0nFVu4d2kVKrEMuG2RtN
	ZI5BA8S1gf+gTFsk36YyUVq5SWIz3ObeAbLPLFuiOw1fi+vZGRd/n2S/cbuxDVCJKdqfpWkevWm
	/y0d5yyI+ghmGVbMMGewBO+jo3wGIwtTBFvu1
X-Gm-Gg: AR+sD11XHdbCMBCAjFKRcAZu9SamwowHKQVmW1Rl6xPXbI90xdin9gxligjA9rcNTZY
	cstrY8TnL32qqXfZ/3sgCDoaZjMth9RxDMYnfDUi2ssdwByFmmM4rVjDhfNxmjSdyfrdl9ZNPGN
	9R1EYFPTuEk4y5KMzOhfyaTGQdDk6pcPfooT3X2snl+HdYSZTbo9DJt0SWLBwwjW9BdPMaL+kOJ
	r1tFGFQRkVcYwAvhXc5WgZks1WQdrcDgwqUYSaboab03KinhPK/IBp+rBamEnqTOTQE5+xABsxA
	24QULwepvjiN2sVra6xuhKd75X/ftkU90qQURiI2pXPqQ9Y=
X-Received: by 2002:a05:651c:b22:b0:39f:fc5b:5183 with SMTP id
 38308e7fff4ca-3a1fd46657amr17985041fa.3.1787759965357; Wed, 26 Aug 2026
 08:59:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADnoEWSR1T+-EjhPtiDuDzETvm5jWcn6aFC_u5LJxNaq1EoM2Q@mail.gmail.com>
In-Reply-To: <CADnoEWSR1T+-EjhPtiDuDzETvm5jWcn6aFC_u5LJxNaq1EoM2Q@mail.gmail.com>
From: =?UTF-8?B?0JDQu9C10LrRgdC10Lk=?= <korn3r@gmail.com>
Date: Wed, 26 Aug 2026 18:59:14 +0300
X-Gm-Features: AcwNN1XlQtBkh2CPtBUsPio410_tdoYxyRdtVZX4xA1CwhUBGIzhvdtCk79N1Bo
Message-ID: <CADnoEWSCveEOTPS43SfK1v9ydEAAyEov8OgDiUf-hiY91muW7w@mail.gmail.com>
Subject: Re: (text) ASUS Vivobook 15 X1504VAP support request (WMI payloads attached)
To: platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev, corentin.chary@gmail.com, ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I added debug messages to module and rebuilt kernel:
[    6.727983] asus_wmi: throttle_thermal_policy_write: dev=3D0x00110019, m=
ode=3D1
[    6.727986] asus_wmi: throttle_thermal_policy_write: sending value
0x02 to dev 0x00110019
[  763.352769] asus_wmi: throttle_thermal_policy_write: dev=3D0x00110019, m=
ode=3D2
[  763.352774] asus_wmi: throttle_thermal_policy_write: sending value
0x01 to dev 0x00110019

the problem is despite those messages dev 0x00110019 my cpu package
power is limited to 15w.
but if i reboot and do
sudo mount -t debugfs none /sys/kernel/debug
sudo echo "0x00110019" > /sys/kernel/debug/asus-nb-wmi/dev_id
sudo echo "0x00000002" > /sys/kernel/debug/asus-nb-wmi/ctrl_param

my cpu package power cap is set properly (output of simple bash script
for monitoring values of current cpu power consumption)
18:45:56 |  3.71 W      |  30   |  64
18:45:58 |  28.36 W      |  30   |  64
18:46:00 |  46.25 W      |  30   |  64
18:46:02 |  44.51 W      |  30   |  64
18:46:04 |  41.15 W      |  30   |  64


no one reposended (please dont write this stuff here, so here you some debu=
g)


On Tue, 25 Aug 2026 at 09:04, =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B5=D0=B9 <k=
orn3r@gmail.com> wrote:
>
> Hello. I would like to participate in adding my laptop to list of support=
ed.
>
> dmidecode -s system-product-name: "ASUS Vivobook 15 X1504VAP_X1504VA"
>
> currently neither ppd nor asusd cant properly set performance mode
> (powerlimit seems to be set, but not governor). confirmed by tests.
>
> got a dump of WMI calls under Windows
>
> mounting debugfs and doing next commands made power consumption go to
> proper values (above 40w power on cpu package versus 15w cap with
> either asusd or platform-profile-daemon setting Performance profile)
> echo "0x00110019" > /sys/kernel/debug/asus-nb-wmi/dev_id
> echo "0x00000002" > /sys/kernel/debug/asus-nb-wmi/ctrl_param
>
> Summary of captured WMI commands for ASUS Vivobook 15 X1504VAP_X1504VA
>
> All commands use the "DEVS" (Device Status) WMI method.
>
> | Function                 | Device ID (hex) | Value (hex) | Value
> (dec) | Action                          |
> |--------------------------|-----------------|-------------|-------------=
|---------------------------------|
> | Performance Profile      | 0x00110019      | 00          | 0
>   | Balanced mode                   |
> | Performance Profile      | 0x00110019      | 01          | 1
>   | Quiet mode                      |
> | Performance Profile      | 0x00110019      | 02          | 2
>   | Performance mode                |
> | Touchpad                 | 0x00100013      | 00          | 0
>   | Lock / Disable                  |
> | Touchpad                 | 0x00100013      | 01          | 1
>   | Unlock / Enable                 |
> | Fn Key Mode              | 0x00100023      | 00          | 0
>   | Hotkey mode (inverted Fn)       |
> | Fn Key Mode              | 0x00100023      | 01          | 1
>   | Normal mode (standard Fn)       |
> | Battery Charging         | 0x00120057      | 50          | 80
>   | Safe Charge ON / Limit to 80%   |
> | Battery Charging         | 0x00120057      | 64          | 100
>   | Safe Charge OFF / Charge to 100%|
> | Battery Charging         | 0x00120057      | 80          | 128
>   | Full charge for next 24h ON     |
>
> Raw Payloads:
>
> Performance:    44 45 56 53 08 00 00 00 19 00 11 00 02 00 00 00
> Balanced:       44 45 56 53 08 00 00 00 19 00 11 00 00 00 00 00
> Quiet:          44 45 56 53 08 00 00 00 19 00 11 00 01 00 00 00
> Touchpad Lock:  44 45 56 53 08 00 00 00 13 00 10 00 00 00 00 00
> Touchpad Unlock:44 45 56 53 08 00 00 00 13 00 10 00 01 00 00 00
> Fn Hotkey mode: 44 45 56 53 08 00 00 00 23 00 10 00 00 00 00 00
> Fn Normal mode: 44 45 56 53 08 00 00 00 23 00 10 00 01 00 00 00
> SafeCharge Off: 44 45 56 53 08 00 00 00 57 00 12 00 64 00 00 00
> SafeCharge On:  44 45 56 53 08 00 00 00 57 00 12 00 50 00 00 00
> Full charge 24h On:  44 45 56 53 08 00 00 00 57 00 12 00 80 00 00 00
>
> Sorry if too many people in CC, deepseek suggested to add you too.

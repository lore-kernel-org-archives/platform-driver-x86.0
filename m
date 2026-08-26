Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB27E370D54
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 18:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787768968; cv=pass; b=IxisF90wIlN+UjvmVObzypmGsCuCZJ/fZYaftLK1KYczkM++MfTKpGvi8mI181Q0BNFWah6jCJeuYsDYSgN7I6fMb0gGFxTyLk3a9Z1hK+ZWnOfuJCr9fbwaOvuXnmAZlUC6zW/6CUI1a8IIDj+kO3QYrPHOZ8UDShKBoRKnEg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787768968; c=relaxed/simple;
	bh=W7mkBWhlbEBQTXcAXYI4y9O+bpp9KINa2CXplI24LYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=hmqyuze1AbdZxo/Z4Qd0AFoZY6rTOklxZ7mW3xK5o3pFHpiNVKL4dvpD/cihk3It8P+qluR/THaQ+aomHIWzDfsMPkxo2AsMBYz76OWPZqlQmzjytkEXE0+JptaHoxMX0qeWOK0j3aD/wc6vxZgZAweReeTojHtSPe8j3hJIZPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5gNXBzr; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5gNXBzr"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so1581671fa.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 11:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787768953; cv=none;
        d=google.com; s=arc-20260327;
        b=DbBIMUpuiGHQsnuWHs5+v7O3b8jUEs6qdKz9EkUePqXITVH3BvnQcE5m60f7C3xOWf
         7GzX71I6uoNHEu6CBvjDqB0G9Kn/xabZ78+P+6sWmfK3ijO7M20vOZQd3/OWOMNEdxMi
         u8mxfQqghWwlfM9M7vQir3BRz2fHuZmLOdXZNr1094Xe4DRq6VSLOEQKnQUcnubhdat1
         T/jADJBsv+DAJaYilVsMAyb+2dJ2zwRfwVVIhycVmoW+I7Mj2xLTlqgKZzS7FTkI0XCL
         6kIIuUU4rZGyx/pzabGheOEdq/V5iMVBCwEcT1mXp3q2SdbsOprtIiyoK75TJ5ZAcVzW
         1LGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9LMLIlbR3UN8G7qFrtL9wTDK1BiXLaCnZuZP3ilgoc4=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=R96rZPo4Dj4YmDJbNng2TQPn/AeTxvRKqLUmu/KhBvN7OjISRied+PIbFbu6EP1ZA9
         Bg8aEzF7n+2Igg6J4YiPqiQWqqTf1b+V9pbzeRehFXGsdw+It5I1mIJLOICKhjdES83e
         x3118T0O+RtuQxo6pzClrbHDHGkYLr0cISh/5RUvasKNiP3thiTyZR3V0mXNKoLvyJbJ
         48SSkozYqkDI9aGAVRxUKqGn7SazLmnHCP3rIsGWRveR35A7GBbP8QkBzQZEq6uY2mOH
         MJrDMqvCLbyrL0HV39RHC4CjFxXrmMVx+8uV9En779YHQd0flrtc1+CliDyFZmWqlIYE
         HTEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787768953; x=1788373753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9LMLIlbR3UN8G7qFrtL9wTDK1BiXLaCnZuZP3ilgoc4=;
        b=c5gNXBzrA44G7VzVBcAjx7xbNcRJyKXi1n+G3HA+CpYmVMzNZsdzmxjMkYassPHZiS
         UEFJgJ0lz7skt96vaNdJsVr+5ySgACEg6835UUUcwlOcZRvN1aqo91udtXYV1gt7z2+i
         8ddrvyXBX2arr9LeGMgUnvRC/QY9HUc50s74qQCvozR+7g6zTwwtAfRDNP8jQV2IfpsC
         Pwu/L7F1Xr3yneYObnvee/c+7nOKaPy3xYSceNvc3yxfabyZ+14a/n3kSu0vUKTu66Ut
         GMNjpWl0a/ZwerA3tTVuws2ZPUwLhhQjKwApZgJpT8dw2TgcAK3fxP7xgrPdhyB/NdOc
         Ui+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787768953; x=1788373753;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9LMLIlbR3UN8G7qFrtL9wTDK1BiXLaCnZuZP3ilgoc4=;
        b=ULv0iKtsqGSYKDyBSdCVUd2XOICOrVNL1fxhaRt/kdDRmqzMHpxctdnNDEs+v8Pewa
         2j4JNg0mJTcsYi0rTwzsUuog4xmhTfF/TeWCZkiDlO2k37mIgGgQ0actv5YUnViod5Vw
         e6lKUxdon3g5rnw79XukpmzEEDmLIKRIP5UZSem/eEfsHXWS5ZmnAmMsVxx6iJFM8nLP
         jfPcrN2CDCbnvAR1YjqL4lE9Bppmqo60UrZ3Tx456JWwbabIVdWXg0KL0HcF6/tOULMt
         py/4BMhkrO+/9IUgWzL4WD2XZo0zmb0Vah9eq/IlEwIaPeff3tJ0rAzoH/FUn7cEWpiu
         Zmyw==
X-Gm-Message-State: AFuF++nVTtRcPPic64YSChL48NaP7s5EOqDD/bQyfJRr5Pq76AJe8GPK
	3iJ8hP4T+kFVll6iJo8tLkmWqRU6n+UCzp4pGVuhOQQVCLExCTEt7B71KNE8l/3gaahOAAB+vAU
	6F/3ZLnX5YHpwbcVbZerFPVMlCnw5J2XBMGlr
X-Gm-Gg: AR+sD10smXpO0SvdTkgVUoNkn+phTvl/C8cq6mS4Wvm4jOCjI2oiAxX3laV1YONRx3r
	8GNHqbHstquX/QAc0uy8shDYqHhuim5riQjhJ4URdsGQntyQhrD/aD9G+88/Wq61uxOxyosuXAN
	DfDED6HpiXhfufjMubkqOq4pCsXKXIlBPBJXQ8KpRZjJoKJvyIRrkTkyJWpzVFDWXF5Cvbmrav/
	1bK9G0v+y4fsYEaXcfwVbno3z5UMRYUX+iDjTQhHCuFViCCZx2glWhlzhiIKdkIeEr72zRbOehi
	SLOrCnfjMe+IPZcUED+OVjfeNBvUXknqMF1km9kgtPywHw==
X-Received: by 2002:a05:651c:154e:b0:3a1:4509:937e with SMTP id
 38308e7fff4ca-3a1fd473b5emr24104211fa.4.1787768953074; Wed, 26 Aug 2026
 11:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADnoEWSR1T+-EjhPtiDuDzETvm5jWcn6aFC_u5LJxNaq1EoM2Q@mail.gmail.com>
 <CADnoEWSCveEOTPS43SfK1v9ydEAAyEov8OgDiUf-hiY91muW7w@mail.gmail.com>
In-Reply-To: <CADnoEWSCveEOTPS43SfK1v9ydEAAyEov8OgDiUf-hiY91muW7w@mail.gmail.com>
From: =?UTF-8?B?0JDQu9C10LrRgdC10Lk=?= <korn3r@gmail.com>
Date: Wed, 26 Aug 2026 21:29:01 +0300
X-Gm-Features: AcwNN1XJXK-9g_SzhWrkQwhafsIxbA0lPCVI2K8qYdKb3Y67V8dr-nGB452N9bI
Message-ID: <CADnoEWTVq+-1DuiUFfpq2n=WObW2h2ivxhmBeV4pg1O9nqqBOQ@mail.gmail.com>
Subject: Re: (text) ASUS Vivobook 15 X1504VAP support request (WMI payloads attached)
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

disregard that, im just not very smart and pl limits even under
windows do not represent very much of how it actually works and what
values are used.
sorry for spamming

On Wed, 26 Aug 2026 at 18:59, =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B5=D0=B9 <k=
orn3r@gmail.com> wrote:
>
> I added debug messages to module and rebuilt kernel:
> [    6.727983] asus_wmi: throttle_thermal_policy_write: dev=3D0x00110019,=
 mode=3D1
> [    6.727986] asus_wmi: throttle_thermal_policy_write: sending value
> 0x02 to dev 0x00110019
> [  763.352769] asus_wmi: throttle_thermal_policy_write: dev=3D0x00110019,=
 mode=3D2
> [  763.352774] asus_wmi: throttle_thermal_policy_write: sending value
> 0x01 to dev 0x00110019
>
> the problem is despite those messages dev 0x00110019 my cpu package
> power is limited to 15w.
> but if i reboot and do
> sudo mount -t debugfs none /sys/kernel/debug
> sudo echo "0x00110019" > /sys/kernel/debug/asus-nb-wmi/dev_id
> sudo echo "0x00000002" > /sys/kernel/debug/asus-nb-wmi/ctrl_param
>
> my cpu package power cap is set properly (output of simple bash script
> for monitoring values of current cpu power consumption)
> 18:45:56 |  3.71 W      |  30   |  64
> 18:45:58 |  28.36 W      |  30   |  64
> 18:46:00 |  46.25 W      |  30   |  64
> 18:46:02 |  44.51 W      |  30   |  64
> 18:46:04 |  41.15 W      |  30   |  64
>
>
> no one reposended (please dont write this stuff here, so here you some de=
bug)
>
>
> On Tue, 25 Aug 2026 at 09:04, =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B5=D0=B9 =
<korn3r@gmail.com> wrote:
> >
> > Hello. I would like to participate in adding my laptop to list of suppo=
rted.
> >
> > dmidecode -s system-product-name: "ASUS Vivobook 15 X1504VAP_X1504VA"
> >
> > currently neither ppd nor asusd cant properly set performance mode
> > (powerlimit seems to be set, but not governor). confirmed by tests.
> >
> > got a dump of WMI calls under Windows
> >
> > mounting debugfs and doing next commands made power consumption go to
> > proper values (above 40w power on cpu package versus 15w cap with
> > either asusd or platform-profile-daemon setting Performance profile)
> > echo "0x00110019" > /sys/kernel/debug/asus-nb-wmi/dev_id
> > echo "0x00000002" > /sys/kernel/debug/asus-nb-wmi/ctrl_param
> >
> > Summary of captured WMI commands for ASUS Vivobook 15 X1504VAP_X1504VA
> >
> > All commands use the "DEVS" (Device Status) WMI method.
> >
> > | Function                 | Device ID (hex) | Value (hex) | Value
> > (dec) | Action                          |
> > |--------------------------|-----------------|-------------|-----------=
--|---------------------------------|
> > | Performance Profile      | 0x00110019      | 00          | 0
> >   | Balanced mode                   |
> > | Performance Profile      | 0x00110019      | 01          | 1
> >   | Quiet mode                      |
> > | Performance Profile      | 0x00110019      | 02          | 2
> >   | Performance mode                |
> > | Touchpad                 | 0x00100013      | 00          | 0
> >   | Lock / Disable                  |
> > | Touchpad                 | 0x00100013      | 01          | 1
> >   | Unlock / Enable                 |
> > | Fn Key Mode              | 0x00100023      | 00          | 0
> >   | Hotkey mode (inverted Fn)       |
> > | Fn Key Mode              | 0x00100023      | 01          | 1
> >   | Normal mode (standard Fn)       |
> > | Battery Charging         | 0x00120057      | 50          | 80
> >   | Safe Charge ON / Limit to 80%   |
> > | Battery Charging         | 0x00120057      | 64          | 100
> >   | Safe Charge OFF / Charge to 100%|
> > | Battery Charging         | 0x00120057      | 80          | 128
> >   | Full charge for next 24h ON     |
> >
> > Raw Payloads:
> >
> > Performance:    44 45 56 53 08 00 00 00 19 00 11 00 02 00 00 00
> > Balanced:       44 45 56 53 08 00 00 00 19 00 11 00 00 00 00 00
> > Quiet:          44 45 56 53 08 00 00 00 19 00 11 00 01 00 00 00
> > Touchpad Lock:  44 45 56 53 08 00 00 00 13 00 10 00 00 00 00 00
> > Touchpad Unlock:44 45 56 53 08 00 00 00 13 00 10 00 01 00 00 00
> > Fn Hotkey mode: 44 45 56 53 08 00 00 00 23 00 10 00 00 00 00 00
> > Fn Normal mode: 44 45 56 53 08 00 00 00 23 00 10 00 01 00 00 00
> > SafeCharge Off: 44 45 56 53 08 00 00 00 57 00 12 00 64 00 00 00
> > SafeCharge On:  44 45 56 53 08 00 00 00 57 00 12 00 50 00 00 00
> > Full charge 24h On:  44 45 56 53 08 00 00 00 57 00 12 00 80 00 00 00
> >
> > Sorry if too many people in CC, deepseek suggested to add you too.

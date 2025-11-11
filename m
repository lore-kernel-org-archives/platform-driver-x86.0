Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4B03E47B
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851450; cv=none; b=QcI9XVCTJYDbzpgSuwg3rFVxg4sGPEOu0xZcI0qa6n2fjhfDGiLOS11trYM3m1Nh9bk46hhhQlzLvO36enarju61JQsWjZ2w6c9EFkck4LqYfpr8EP7aBdPucUq0IBKMMM7YBvnBdoqTocRzPrxL/IOfAqGVm4b0quga82Q7qoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851450; c=relaxed/simple;
	bh=gdQkVgT/+48fUwdMLqSLWpxSwh/BwfC41Jn3uuTjV0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyKIX1uXGSe/8wtIq0/63DL5Y1HojpcEW1Qti0XteBglFudecQO2+tW/U5SKONcFBZHA3Y39Qf9kozf6z7Fp7muA+Y8BaGW1dUeyoRCSjminQgNlCp1JSJCk6O6zX3JihYLfuY9XiQT3+Jo8ACKDHmpNK2TxA3BAt8w7MyjxxkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C12vwB4f; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C12vwB4f"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88044caaa3eso41292366d6.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 00:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762851448; x=1763456248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NearZfi8AE0dK6wy1hVxuaWnPdPq9ZEcZw/FG52ZU3A=;
        b=C12vwB4fuDMLUdkqc3T3pDXUTSFYPHIVRrSgP8/T+9cPUe+r9gNMO5uiD2aaNVJAE8
         4iMiih9Lv/dc627ryu89vcbP6ktdJjnzkKYYA/zJHenCmfRLw0WVab/LxIMurldlecyW
         HtO3IQbocICRCGzstCv+0+BAHgp4I+nfaH1iaiqk9K7itA5Ahowp1TmklMcIYWNjfm2A
         efyUaHoz8FACO9xmRXGCRxpqSyRWJKGOrkEI30LdORa4+G9YduEwc0GD5o5/j4CQze+H
         hBZt7NVzonJOzYUbWJ6eofxMkz7la4Dja/7PddKgezIHTs6pCY0aBZg85RPz3HIs8s0t
         Jeeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851448; x=1763456248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NearZfi8AE0dK6wy1hVxuaWnPdPq9ZEcZw/FG52ZU3A=;
        b=VPZ4KcKxMthS9hBgdkjTEflGvUik7Hjp2SE+FRJF0xQuDLBqRs0IK1ZfezRwof5llf
         Dcku+X76LUAhk8eI7+z0VJS0uVSSPPpY1VytYxdovDlunZCLBQhgELLY0dCrvo4fJKyV
         Gyf9g0KwHFaJZXXbQUulkzhTjzuujsiyGn4haVYQS6SL2wmyrnYD5buMyNXAWQSrjmvE
         /z7kJVe1PON6QoCAKIk+W5ZidE2nJJ0fyKlfGzHcwd2T81DDKVdWLskGlK/CNbkS1RHp
         24TzPk2C1otLH9hwWbxPa1vSFysjZmekbN5CD2jtWaZpDeDRAQMKSj1/03EJHiahWKA7
         nl0g==
X-Forwarded-Encrypted: i=1; AJvYcCUYRfVoPodE+ccRkOWa2NDJVjpqpNqQzixK+oXYyDTzx9/c/m+7rRtXw++IUToW4gGsoh3vQhJ8Lv+mkxehTMQFHuP7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3EHx3E71pe0zW8NN2CQ6+IT429DOXimNRs9EvuJUobV9ypvf/
	TR68cKpNyH13gAmnb0/CRyOdrrAPdS3wtIXyocOdW/f21uO39Ce8D4Z9aiNH46aQtaLjX4wh3Qv
	p5xcZlkyXagJgRc7vyVqAxbZdtCCXh4k=
X-Gm-Gg: ASbGncs3xd69qPuKcqf0OKLGBibmvrIoOH0zumjCB7EuV8sHJ4IqErkeLCqvnIzhwB/
	qKO96DSZA+za4Yg5cLbxODGG2SOzTDkzv/rPi+rf3fRNEYgD+SpFR+lQU+87Uap/GIp4jdO2ZW4
	2QHsRvW3gxfGIiW6sq/Qu5cf5O2ov3DIunM4GJkjWLHWz2/Hn4fVVOwwyEnkYdgvwwK7wxJXlsg
	dkAaA5omvO2OshpsMhRJXF6mIRJxSE+z1SLEtidxFiLX6/VJ6v5yby2xndOb/d+FJ7WZat9oPgD
	w+M0TuFBkEjb9KLMusGvAFX6ZziiycADV5SqRtiLnw==
X-Google-Smtp-Source: AGHT+IGhTEHR/mdsqXF9MftYT166gXmlel5OpfQKQVBRz6wH34AFNOEzcbEOCrrAriAL4OxxxYqt55fHlrWWNc8Q19k=
X-Received: by 2002:a05:6214:1c81:b0:882:63cf:3979 with SMTP id
 6a1803df08f44-88263cf3bcdmr9012486d6.45.1762851447849; Tue, 11 Nov 2025
 00:57:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org> <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org> <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
 <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com> <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
 <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com>
 <6f81529b-7ae6-4d63-b0f3-7787a668698e@kernel.org> <CAD-Ua_hAxj5PskiFdiEA7Qt1bWEhKRvCNAyQj0BQmZ2vDnV4aQ@mail.gmail.com>
 <089b2cca-4c84-47b0-a96a-0363ffd642d7@amd.com> <CAD-Ua_gxPsTbG_3shtqAZX_E4ns5hHPZbTszQAXH2jbfLxP_Rg@mail.gmail.com>
 <eee498d1-6c12-4988-9a70-1e108848da62@kernel.org> <CAD-Ua_hX_PYxYUfFDcTv3R4pV0s5ninRSK+-1zxtttMhSPoQtg@mail.gmail.com>
 <c31b5a46-5dea-48c6-bfe9-b3efc989f0de@kernel.org> <9885395c-fbf0-447e-a9b5-2231a3071dc7@kernel.org>
In-Reply-To: <9885395c-fbf0-447e-a9b5-2231a3071dc7@kernel.org>
From: Lars Francke <lars.francke@gmail.com>
Date: Tue, 11 Nov 2025 09:56:51 +0100
X-Gm-Features: AWmQ_bn8564OQiFNmP_4f6oSMn0B-KEWGS1dQk_WDeVObBH453KSBxVR7ZbUXlw
Message-ID: <CAD-Ua_j=GiO9yjy1rg99xQXdTxV2Vp+3qjiUoMomLWZEEe0tyw@mail.gmail.com>
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Mario Limonciello <superm1@kernel.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, platform-driver-x86@vger.kernel.org, 
	Patil Rajesh <Patil.Reddy@amd.com>, "Shen, Yijun" <Yijun.Shen@dell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 5:16=E2=80=AFPM Mario Limonciello <superm1@kernel.or=
g> wrote:
>
> On 10/30/25 8:35 AM, Mario Limonciello (AMD) (kernel.org) wrote:
> >
> >
> > On 10/29/2025 7:22 PM, Lars Francke wrote:
> >> On Wed, Oct 29, 2025 at 4:38=E2=80=AFAM Mario Limonciello (AMD) (kerne=
l.org)
> >> <superm1@kernel.org> wrote:
> >>> On 10/28/2025 6:45 PM, Lars Francke wrote:
> >>>> On Tue, Oct 28, 2025 at 6:12=E2=80=AFPM Shyam Sundar S K
> >>>> <Shyam-sundar.S-k@amd.com> wrote:
> >>>>
> >>>>> Can you try the attached patches now?
> >>>>>
> >>>>> First patch is the same which Mario shared last time and the 2nd on=
e
> >>>>> is on PMF to handle the .restore() callback for hibernate.
> >>>>>
> >>>>> I have tried this on 6.18-rc3 (though this should not matter)
> >>>>
> >>>> I just did and I'm afraid that the patches made it even worse for
> >>>> some reason.
> >>>> Hibernate works but when rebooting I end up in the console, the curs=
or
> >>>> is blinking but I can't do anything - no keyboard input, nothing. An=
d
> >>>> what's even weirder is that after a reboot I have nothing in my
> >>>> journal on that boot. Not a single line. I have no idea how to debug
> >>>> this behavior, sorry. Usually when my patches broke the system I wou=
ld
> >>>> still get logs. If you have any idea what I can do to debug let me
> >>>> know.
> >>>>
> >>>> Thanks,
> >>>> Lars
> >>>>
> >>>
> >>> FWIW I tested Shyam's PMF + my CCP patch and didn't observe this
> >>> behavior.
> >>
> >> Thanks. I tested the patches on 6.18-rc3 and I observed the same
> >> behavior.
> >>
> >>> Can you please add this patch and see if it improves things?
> >>>
> >>> https://lore.kernel.org/linux-pm/5935682.DvuYhMxLoT@rafael.j.wysocki/
> >>> T/#u
> >>
> >> I tried this as well, didn't change anything.
> >> I'll try again in a couple of days with various combinations of
> >> patches just to make sure that I haven't made a mistake.
> >>
> >> Lars
> >
> > I have a suspicion.  With all those patches added (mine, Rafael's and
> > Shyam's) can you please try to hibernate and then after resuming run:
> >
> > # rmmod amd-pmf
> >
> > And see if system hangs/reboots in a similar way?
> >
>
> Can you please add this patch to the other two and try again?

Sorry for the long silence, just back from vacation.

I have now tried these three patches on 6.18-rc5:

* 0001-crypto-ccp-Add-an-S4-restore-flow.patch
* 0001-crypto-ccp-Prevent-calling-psp_tee_process_cmd-with-.patch
* 0002-platform-x86-amd-pmf-Prevent-TEE-errors-after-hibern.patch

The good news: The original error (TEE enact cmd) is gone after hibernate.
The bad news:
* I tried four hibernate cycles
* Two of them did shut down the laptop, two did not
* After resuming from hibernate I could not reenter hibernate, reboot
or shutdown at all on one occasion
* I don't have logs for any of these :(

I assume these two are unrelated:
* On boot I now get a message "RDSEED32 is broken. Disabling
corresponding CPUID bit." before I enter my LUKS password
* Twice WiFi failed to reconnect after boot ("send auth to" followed
by "authentication timed out") - I'm 100% sure this is not an issue
with my home setup

I have not tried to debug any of these yet as I'm just back at my
laptop but I can try to look into them a bit more if there's interest.

Thanks,
Lars

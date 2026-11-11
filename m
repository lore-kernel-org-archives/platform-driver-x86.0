Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794407407;
	b=Qk5fd5VjveZJ96A1TAmMjSbtpRimdaBSIVj6atsCCtxfa/p8diDlE0A/j72gUWalahEn
	 62IBZmZscIq1T+LTiqaGp9GUgUOyfcr4aQkTM3tmvt1ldPmnuq59pK7v6DVRf9Ueh8fcc
	 jDmbBTV2+z3tS7miFt2JhMmtjtLwMkzwioV+vhgdiaPNPYctQQ0TlDTyLix83RFyNtz7I
	 Mx0lOUTf6gD1zxjTdJsfBbz7QF/Q/805VTv+h52SXO5yCKjECXb0tr71Ia2GHvyOz50pE
	 2jEwRvG2NNGIrosh+Q4sLJkeBeqhiuzAg3XpMCqzL0hcZDW0EKMSM6U4XrU7YxuQegA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=OgOZZikWH+f0AK3FTB/Vqy2qNReofj6woX/ynDbsR6Q=;
	b=yIVrRcw+69db5i0+lV51dPFiPDhcAsMfqw7gNSK7gV2lLXveALVOzj/lXd6KnbW30AtW
	 tic+Wfz+2MyERwoRuqHj2bwy3uobRREpCkzDJhN6xcnBbb9uuG/nKq3G+hiTt5Dy4xXnW
	 4eS5QSZoYKv51oQQakTDXLGJyCvywhMe1NyqAVTIItJWPvCSxEG1+zvzx4xq2D1tldXcD
	 Yt9z2R09RJHiUrBY3UVML4UfNNrL3EUvKtMOm6AK4zazkadp1Ni0djaFCCXM/2qIxtR7I
	 8QwAR3iE/Ys9098lKdl9yv0ri8DMmEfi5Xqm0n1Jks8Q62BweTTtUav0mBwPnl0jjoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I/sl7PND";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F54606A33A
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 14:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F54606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I/sl7PND
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso3940464e87.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 06:30:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794407405; cv=none;
        d=google.com; s=arc-20260327;
        b=m/3bvye9/U3Cwj7jO7AuoT84KARBA+dP66iBN85Cm3xVrudvot4MM7u8rGIOKIvtKW
         FT1glYcu0/vijwWgzD4EFp7yb1pT4CJTtUzA211LoNvXDGixGmeDhUoPGFDe9xtARL/X
         QlYsGQDdRHd/lbsKowtqJCinXRIzDLMZAbcXZJpvHT9/Qr+oczfgWsndGBqMfIfkTE0U
         HL5Yhx+u7roG4mmxfzeIXMgTpBOOtA25bbpwCCIHB3iZa7hhPMPj4MU7OOuF65ZR0hj9
         Q2xF6XPZq4xM+5LEeeGqIPQGdlbZVt49n36ilfEEUOb/I1v+IhKzH8KF3nsa32+8EgYG
         Unbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OgOZZikWH+f0AK3FTB/Vqy2qNReofj6woX/ynDbsR6Q=;
        fh=YLEoDtbKL1aLfhD5tMQScjkJvcBKCkJA6QKs6ZBCyX0=;
        b=S86CsMzcRWHIQzMPvPbVKRyjmUYbJSfRssnKnpb12s1BArykWnd06OmOxHaDP6iDBi
         aZCjiOVh3VrnOaB8saJDuTUEiO8ISTOoUV31ZQFehuMs7ueNmDYHnktbR4RxSNPoBF7j
         4bg7ZXqBZYDe3qXmhev6PlfB8j3N0eoB5Y04Pk+2xVWiISPLVglsbs5AH8Opht59JFlN
         QyRFv1aZHqoDY23KzEzhAKQiyWhsXX0IVcPLa7NU2Xuh+lcHkl9JySwfCLzyfp4MTj2N
         EjW68QNcNXqA+S4EOYKWm+aCeYEGuggKZLv15VRBOAtayaTCwlNSLQz10vcCrheRxHnw
         2HLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794407405; x=1795012205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OgOZZikWH+f0AK3FTB/Vqy2qNReofj6woX/ynDbsR6Q=;
        b=I/sl7PND+JVxXAEugFGESc5+Scur+dFPRf9DX+nwpJB7PYUrXjRhLtx52XSdeHPx2F
         IX8FFbokjp3qOBsUkJjV2EULpCNVFMSWp12ZLJmumBpso5ND/c6cEal70RH7W01AQ6Ef
         n7yCKNYuT2PVT+ZjUJkApECv3TRlDSjWZdXDS4BfNO0QxppqX8ucMeLxsI46PFIZhCzu
         HrQplz5csTzngHfXqCRsuwsatZl6YKbjS0AjGa+AxDmUZnUJKPUfz8IU7YhZhJgi+cfW
         igCS+AoALz27pAKwdjgy2YV5TpE34NiFyLkJcNr8mdqmffdGg9vWDvUSj7KvSWKy3wsv
         q7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407405; x=1795012205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgOZZikWH+f0AK3FTB/Vqy2qNReofj6woX/ynDbsR6Q=;
        b=f0TW00FPYVi4GEq9t4jpPTpQK0BhJ0niVwRKFCKdHVPpmpHWmFFqgSXtNJ3Okl+d1o
         ZfkVe6WUfTu/wzGovU1Tok/eCrpi3W4tGT+ulqG+s9HMicvuQ2SrPd6VAHtthSNGhnTC
         TIN7V02btSjDXQZwZYgpR17+1zFGjyjYwzE6TuLetvHn2soFxZoHiXjO3C6/aIDRzTZ7
         ul2JjjosFDMiDjMH+ufK83h12VaGGjhaOp+ggLTKsGp6cD7EhY+qeebjLlQEjL4KRn5y
         8tkAVlZ8fiLo+87kYMckCTfH9DCeRLl2cqA7urfXm+pIieNF0zm+tsAbfl2rXxPeZ1dP
         z8UA==
X-Gm-Message-State: APuU4Z88WtEgpFJzqprxPgMU+y67mvYgFXfMier+Cl6B60OWDvcSSkfj
	jj8xOUcKwcd6c+u96jt6doNwwnChURJZ0JgrdraWgRVMFJuI0hEYJ8aC7MXzu98aUV1chHyio08
	rplH45BvHi0fL6xletu1yklTMCBEwqDe35scLP88=
X-Gm-Gg: AYBFou2aKSBgHEnJjCzy7XKfGoX2SZYBEOim+iI/iPZWeHVdFzmF9GB0ijwyo5oH39K
	7r/DDr4Oc2jwvaGI5qY2Xql9JETKWuXH6rrWpDwlcNQIXKfBCueQoZK+vdf3oDO9x9KVPil+0Oo
	o/esrhyCw2ZBAGdduPPsj9BYuDxnGKWxWL7M7Z3B4ORGYkCjh/B/CKoXRJI9ZMUw8In8KC3iIms
	jIydLwKtpb5ioTB6Sypj9BkVu9FtlLSW2KirRWnfPA5DOMpGhOslsPm6qCKJpdbrEXxSqD2JMG8
	OSPC919oSfpd4X2COhR2Jw4NQJ7bRBnjb2vET4Sq2S9xIjXmpbc9I7X1yijt8EF5F1zzGCtka+f
	b943PgH08OY4p+SttiSNcfRXA2p2jTEo6RhIc
X-Received: by 2002:a05:6512:12c2:b0:5bf:e72a:7a08 with SMTP id
 2adb3069b0e04-5c15d630cf0mr793615e87.35.1794407404859; Wed, 11 Nov 2026
 06:30:04 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFbNUuJGjo5OW1JZhO=uXqk07fmzE8yo2Qibe5PoOtHCmoQXpQ@mail.gmail.com>
 <ccc319f4-24aa-496b-8366-fcfdbd5dbce6@gmail.com> <CAFbNUuKTvJXoNqf-5K7VykOHtFFVdVHTc50aYswC0if4eGQN8w@mail.gmail.com>
 <ecdecef6-b2da-4d3e-bb82-a22a15febaf6@gmail.com> <CAFbNUuLXaP4_257tWkr-09n9h9yZX_y772LMStPY8QuGOWAipQ@mail.gmail.com>
 <eb504790-1f37-4288-9f72-0a3d7b10af3b@gmail.com> <CAFbNUuLmaoq22pQPzrUidJ+RC2xf2u5Ovxzy5d0LQZ7owH52OA@mail.gmail.com>
 <e4ad1ce8-6938-4752-942a-7ac6c4ed26c0@gmail.com>
In-Reply-To: <e4ad1ce8-6938-4752-942a-7ac6c4ed26c0@gmail.com>
From: okluar <okluar@gmail.com>
Date: Wed, 11 Nov 2026 17:29:51 +0300
X-Gm-Features: AclHuK8vUq5VjK4hlG0FrdeRmcW68mFzhRWUfJ4KL8j7Q3SczIiXwc4kdFOYckQ
Message-ID: <CAFbNUu+zETsyfBwdVo-YxTB2vUG1yBPphwusEy+ViNVMzCpk-Q@mail.gmail.com>
Subject: Re: [BUG] platform/x86: bitland-mifs-wmi: performance profile fails
 on TIMI A30 (USB-C only)
To: Mingyou Chen <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 4:17=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> =
wrote:
> Hi,
>
> I'm confused with this,
>
> could you print the hardware returned function and input->function?
>
> dev_dbg(&data->wdev->dev,
>          "wmi_call function=3D0x%04x, input->function=3D0x%04x\n",
>          le16_to_cpu(function), le16_to_cpu(input->function));
>
> insert this inside the (function !=3D input->function) if block.
>
> And could you test another thing? Change the condition to (function !=3D
> le16_to_cpu(input->function)) then test the driver.
>
Hi,

I tested both things you asked for.

Test 1 (function !=3D input->function):

    wmi_call function=3D0x0800, input->function=3D0x0008
    bitland: wmi_call ret=3D-42, data[0]=3D0

Test 2 (function !=3D le16_to_cpu(input->function)):

    wmi_call function=3D0x0800, input->function=3D0x0008
    bitland: wmi_call ret=3D-42, data[0]=3D0

So, le16_to_cpu did not fix it. The hardware returns 0x0800, and the
driver expects 0x0008.
Then I tried changing the condition to "function !=3D
be16_to_cpu(input->function)" and this works perfectly for all
powerprofiles:

    $ powerprofilesctl set power-saver
    $ cat /sys/firmware/acpi/platform_profile
    low-power

    $ powerprofilesctl set balanced
    $ cat /sys/firmware/acpi/platform_profile
    balanced

    $ powerprofilesctl set performance
    $ cat /sys/firmware/acpi/platform_profile
    performance

Full dmesg output:

    wmi_call function=3D0x0000, input->function=3D0x0008
    Failed to unmarshal event data: -61
    wmi_call ret=3D0, data[0]=3D2
    wmi_call ret=3D0, data[0]=3D2
    Failed to unmarshal event data: -61
    wmi_call function=3D0x0000, input->function=3D0x0008
    wmi_call ret=3D0, data[0]=3D1
    wmi_call ret=3D0, data[0]=3D1
    Failed to unmarshal event data: -61
    wmi_call function=3D0x0000, input->function=3D0x0008
    wmi_call ret=3D0, data[0]=3D0
    wmi_call ret=3D0, data[0]=3D0

By the way, I still see "Failed to unmarshal event data: -61" in dmesg
for the event interface. This seems unrelated to the profile issue,
but I can provide a hexdump of the event data if you need it.

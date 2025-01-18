Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391F15FA7B;
	Sat, 18 Jan 2025 07:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737184509; cv=none; b=NcbRXwMrfW23uE3w5aWRb/4rSnrPIBAeeZvIwUwpsnBuECSFKfSbFfK2f8dxfqlE22KLMotodX43NtiyWSeCR7+B1Cbrh4EE7FCZd54lBP91K7aGipOktg46uthnjMMq+zr0GlyMy94T036JN6zQ1p60q0WyfY4HsLmCPqoS290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737184509; c=relaxed/simple;
	bh=wNmDHQ8sM22dpRZhb5SkhXcHhmnvoGxGCxxEaCjupL0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=bIPY8l376OTAKDOZcVxU3Z0S6Mtzr7fsPSG9CkOHawQd9NYmuT7zF6THL+iPTsaOEyVrnGbTH358wCZUsWxcN/mFn54mf1oYRGxLaeJOvixV4oVHxO49YDStephEtYrbezyAGwgcPR12ks0pqykrOga0x3cD2s++hiFTgkDK0pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjjeXcTR; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjjeXcTR"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e399e904940so4427171276.2;
        Fri, 17 Jan 2025 23:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737184507; x=1737789307; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRbs38OMS608qU4pUvkirXtgam3LtoRnMOdROZ49VxI=;
        b=SjjeXcTRpLciRXMUpgF/lkrbL7oXcokzuPS3Uykp07Qq6fC2acwWppgW1FKA8xBCQ2
         LxtkX0OqS/oI/VFZsL2RueqalqfVUv/eHFN6JrwKnojr3Nd8URuxzO1WI4sJ+55+4Px0
         qwdf2al89xpiJSsocaf+98vkUh4L1FjVpmSq+o4iaGxF2PGuQq9/X5jdrp8kNHZ/z1fW
         9CwBO83V+w2gh6GBYdNJxAI3hCY5HYkx4+r4pk3sIqphDv0tm4x1/lutPrOwOaxm6vXA
         xPgVrQjT8kPuGX36qCP36PhqHzC3+PB4MKaMOJk7hAueVMyPpl5fEQZ810wioSC8UGsn
         Xk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737184507; x=1737789307;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WRbs38OMS608qU4pUvkirXtgam3LtoRnMOdROZ49VxI=;
        b=nFz3EeAn/a5Dix46jZHAlGtZYhzpTE+OMTFqeQXJZVPNRpnNcPjPZCJhtMdkcKdkUc
         Lq8QSMSkcx2cL4NuSExKG9M/ZnKCISIQE0Z7AuhLQoOMNUvKNc9gm6feBTJq6MgKchPx
         euZWX+U+UdZhCqa1IPLRMb8zyWH8OAZnme15W6S7AfBWg870Wv1ZLd2ERvv1QY9Qpwzp
         bG8IEvlhymh8q7D+1N5I2Z1uaHXte9sd38pTWvX+bwVcZk1d9Ws2QeLjp9xWsdtdTd+i
         vctBmegh7kB0t98wwqNFBx0wkBJVeBosZLc13/fRSd4R/tWbquJ8nXPfvbruOizpqcn8
         5tyA==
X-Forwarded-Encrypted: i=1; AJvYcCUACP3McTQ0daaB9S/P0VxSAdWIUm8k7qBVJZBlkZW6y073mbybGW+QAv5NeN2QthFQAMHbbldC78a51Iaa@vger.kernel.org, AJvYcCVIO4dagF5Vm4DVP5DNRC8A/on0PUiwAIH+d95STpFRxAXf7xFjkodFkUMO+wohSrAFSqJ6VephO28=@vger.kernel.org, AJvYcCVLXguc6WqMNFH9+U/xIlY2cOHCIXndUU3F+aY6NGUuIHtpRrrbIoNxczmvOXmobq4xaFg2QOBCLpDFkyessVtvgwYyIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySMZKq8y/dCWrDzIg7GmD5BiiIePO+RyHbAT5Q5ILADSURVK3/
	434GKPljXT+SxYQoHy3SS0t1VlucyPFnE/+si7CvBo3Fh0QylGz7
X-Gm-Gg: ASbGncuqOjWYaz0P0xayYdv5dKxErbPD6Jk5QVSl4V9dT+YIT7ctgbowVWrGMsIzJVF
	FndVRgXVtdwVI/IYlu/5kdevwjK9qMy8bzbWYZ3G80yw5FxRm67OfYOWi3kGZd+0lSqqmXSMtbz
	t8YZh7qoA6fo7cggopgX/6jU+s5gRpwIR43ovpT37Z70ZPAXIqjEw/mBltQqI6YgcLXADWYnKiv
	A2y68inGlV1E15KLjfBuNG/KPhHkyWIfHAEQQqaX2npf0KsC6zg9bh5ygJDtA==
X-Google-Smtp-Source: AGHT+IETriYVFOzah3uIWNkkcmVY7ey+ZRBFJithDddjKX9hPxRyO/lY+0YxK+7Twa3VUnjC1aHePg==
X-Received: by 2002:a05:690c:c83:b0:6db:c847:c8c5 with SMTP id 00721157ae682-6f6eb67bca1mr49419627b3.16.1737184506905;
        Fri, 17 Jan 2025 23:15:06 -0800 (PST)
Received: from localhost ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f6e63fddb1sm7225067b3.30.2025.01.17.23.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 23:15:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jan 2025 02:15:04 -0500
Message-Id: <D750IFZQU40A.1KI8A2LYXID19@gmail.com>
Subject: Re: [PATCH v6] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Joshua Grisham" <josh@joshuagrisham.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: <W_Armin@gmx.de>, <thomas@t-8ch.de>, "Hans de Goede"
 <hdegoede@redhat.com>, <platform-driver-x86@vger.kernel.org>,
 <corbet@lwn.net>, <linux-doc@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250112150910.13489-1-josh@joshuagrisham.com>
 <f91b823c-593d-dbdf-e453-878e61f329ec@linux.intel.com>
 <CAMF+KebFL_9bF5UE4Pb7OQsQ6xJ6vWUXu5+4SWbnteVP_xOyaQ@mail.gmail.com>
In-Reply-To: <CAMF+KebFL_9bF5UE4Pb7OQsQ6xJ6vWUXu5+4SWbnteVP_xOyaQ@mail.gmail.com>

On Fri Jan 17, 2025 at 7:38 PM -05, Joshua Grisham wrote:
> Hi Ilpo!
>
> Den fre 17 jan. 2025 kl 18:36 skrev Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com>:
> >
> > > +     err =3D devm_platform_profile_register(&galaxybook->profile_han=
dler);
> > > +     if (err)
> > > +             return err;
> >
> > As you might already know, I've in the meantime merged the Kurt's big
> > platform_profile series so these need to the be rebased on top of that.
> >
> > --
> >  i.
> >
>
> Yes thank you! Actually I see that there is also an update to
> firmware-attributes, i8042 filter, and platform_profile on for-next
> that all now need to be implemented in this driver since the v6 of the
> patch was posted. I have a working version drafted and will send it
> shortly (along with the comment folding and spacing requests you
> made).
>
> One question and maybe more directed to Kurt regarding the new

Hi Joshua,

> platform_profile interface is that (similar to how I did it with the
> above v6 implementation), it still feels cleanest to locally track the
> different "choices" within samsung-galaxybook since it can vary

You are guaranteed by the platform_profile API to only receive selected
choices in the profile_set callback and there is no limitations to the
profile_get one so I don't see the need to store the choices in any way.

> depending on the model, and this get_performance_mode_profile()
> function needs to be able to evaluate during runtime what choices are
> set vs not.. so in my draft for v7 I have opted to add a private data
> member for platform_profile_choices and set it up during "init" of the
> platform driver pretty much exactly like how is done here in v6, and
> then during the new platform_profile probe I am just copying the
> choices set from the private member to the choices given in the probe

You should just directly set choices in the probe, that is it's intended
purpose. No need to set it first and then transfer them in the probe.

> callback. I hope this will make sense but please do take an extra look
> at this when I post v7 and see if it looks ok or if there is a better
> way to do this (again keeping in mind that setting/getting during
> runtime will need to be aware of what bits were set up).

The platform_profile class takes care of this internally.

>
> Thank you again!

If you still find this confusing or have questions let me know! I also
left a couple of suggestions in the new version.

~ Kurt

>
> Best regards,
> Joshua


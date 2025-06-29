Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D90A233136
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jun 2025 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751216171; cv=none; b=QQxC82T37Ckn3HsCegmp4JTEqYTUdmGEi8T9Cw7KUFDx3SnslawV7MjoYznDXgREJvR+fH7NJIl1W5g1hGDo5+aeGqthxWNo7FdEMdJJVY1w3gMFn3FD94JHevjSwv94XJRTysbKrVZxRCf501hqyP7HMWPFdp4LhQClZ8N7Sx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751216171; c=relaxed/simple;
	bh=UtE/SP7cf4e1YzoP30u+sGQI5/oLaD0kH4kJEqvgCH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=VNAijO4Z8KOjVBGoZjw5U2FsIyAiL/Oq2lxhZFr1hstcWBll2noqpY8qM5lYw9qyEDTNMCsOtyX8IAdxrV6/mPbbmf/JIqSerF00Btxs9ECdZ9xBlk0VjnX8xqDFro4xp48GyBnVyUwLzttSjxK3t2PUyUyfva85XW8Oh55W+I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aogUYeqe; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aogUYeqe"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so2539650a12.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jun 2025 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751216165; x=1751820965; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sdMpqPG/GdTmXmqNesT9o9xAVDhLzfuc5WtiPi0k8aA=;
        b=aogUYeqe6mePmwGOZYOdhJ1nYVFXl5XbafzwZPKUhhz0d7GhdsMOWDFASSNRMP+urg
         Xakt24Z1oSRHDe3LR8sN6/TA/4r7JhMFC8Kd/4AVmMkGKos6G/LShlCofjnTFJoX+YC7
         S3jFXEgWs72JCpDD6YgTqFP1Lz2Ocg3hDHydE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751216165; x=1751820965;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdMpqPG/GdTmXmqNesT9o9xAVDhLzfuc5WtiPi0k8aA=;
        b=m2crCtZ1c/SRib5kvTlSRJqM0wFg2W+SUiRFBxVue4ifrK0dvuOQMiX09pWbNCJpHg
         ItUpn9byoavTM2fa7z3mnYmNHnqopYsJfRS676tbSnA2K6zYLsIZHZ3qiYe0h31BXG/B
         gHmj4PzcMwVFMirtFc7L7hZl72Yt+I8ScC/xNhDuxNKUWEnULk82v8JtrYtJFeC1xzQH
         2APEb7gK2yB1ohaQk2WpIFim9WNpvLNbqG3/DY29BcjmhTbrWknUUym9zhMIaHBFTJx/
         I/lJLCwZn2BHH4h3ReiB4NOR8JQ61NqvYTlRtGwmeERhr90EcN+pF+DGCse/JvPl4rHp
         LKsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKk3eX/u+z/w6rrc3TU31lXOkPQ+MkcHeqsEyHTCjc3DtxQT9mn0vjovUrvPh75QnMxWjiMlgQwfkc+KWiwkIaBg3T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7O6QH3LyurnJB4cjDSdYuD0m/+VJ4dloJiW6ltKDhCRkobxyd
	KSxa4P6mRKFXHvGlNmSqlM8m341qbeg6A1Zc7Mfxfu0hr6WYyBp0vq3Vz5m+jBGnPUyscnguzNl
	l2V3Ldc0=
X-Gm-Gg: ASbGncugZ7x0PuYTQZyGHS9duSAAjUaGSsk5eSguxwWqGb4+4syjm8sIOsuWNSEvs4y
	EDczKmjQHFHnX4mH74D9AKOQkdX9Suyn6HWYAbYQwIamDIB9uCUSR8Ql5mAw8cVZ4A6f3XaCJ09
	A65Ema/1w7o+2GNPbE74+DQXaIJv0beJ2iDNLeUloH80ijsGhRM63BKllpnyLOi0oHlQIukSG0Z
	lREwwQI3ps32RQ92gvpBkacV8w3WiUb+WtQ872lDEa2Jc9i1HJ4Ui26tGcYDkfz3xOA8JTSSQlA
	FCniKwzROpl6lCBSId/kXLq2t7n3aCi0ARg52B6GL3FfOZTJjKdGT9uG14TyPMEjpkltWZv+XVA
	ujYr1ls3vrHO55p2+MbhTi616u9aohAfogZRn
X-Google-Smtp-Source: AGHT+IFECJT3gZU1XErWDaqsDWRtcaPDy9SYOo4tOJObAdj3ZTTtdmaPKm0vfIfxRiqP7fiY4za9YA==
X-Received: by 2002:a17:907:1b29:b0:ade:3bec:ea40 with SMTP id a640c23a62f3a-ae34fd2bc54mr888267466b.10.1751216165451;
        Sun, 29 Jun 2025 09:56:05 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363aecdsm525129066b.16.2025.06.29.09.56.04
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 09:56:04 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so2539607a12.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jun 2025 09:56:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpvr0J/9SAwlHzN74pIfyphafyMUPVZhp4X5ejRyXtNhIFIzzVrLz0nbzWmswJZNTlk3YHE59lM3Vspfa9kMNJqKvE@vger.kernel.org
X-Received: by 2002:a05:6402:3585:b0:5f7:f55a:e5c8 with SMTP id
 4fb4d7f45d1cf-60c88dd8cf5mr8626815a12.21.1751216164051; Sun, 29 Jun 2025
 09:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <740368848.567654.1751195731131.ref@mail.yahoo.com>
 <740368848.567654.1751195731131@mail.yahoo.com> <CAHk-=wgMiSKXf7SvQrfEnxVtmT=QVQPjJdNjfm3aXS7wc=rzTw@mail.gmail.com>
In-Reply-To: <CAHk-=wgMiSKXf7SvQrfEnxVtmT=QVQPjJdNjfm3aXS7wc=rzTw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Jun 2025 09:55:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjOg3ODTiNF9T5Kifwiz2FnU5DCrUB1MLxG1mnWAo_k9w@mail.gmail.com>
X-Gm-Features: Ac12FXzssdxGOebQObz-lkdpB6sdI_Cbki0eQc1k8JjJ_TH5jEgtoGA_onWSdss
Message-ID: <CAHk-=wjOg3ODTiNF9T5Kifwiz2FnU5DCrUB1MLxG1mnWAo_k9w@mail.gmail.com>
Subject: Re: Linux kernel 6.8.0-62 generic null pointer
To: Jan Graczyk <jangraczyk@yahoo.ca>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dell.Client.Kernel@dell.com, PDx86 <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Jun 2025 at 09:19, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The band-aid fix looks fairly obvious:
>
>   -       if (!obj)
>   +       if (!obj || !obj->package.elements)
>                   return -EIO;
>
> in both places, but I wonder if there's something more fundamentally
> wrong there that the elements array doesn't exist.

Bah. That band-aid may fix the oops. but I think the problem is deeper.

It should probably also check that

 (a) obj->type == ACPI_TYPE_PACKAGE

 (b) obj->package.count is actually large enough for the dereference

because maybe some broken ACPI bios ends up having a non-package
object there and then checking "is obj->package.elements NULL"
pointless, because that "package.elements" may be something entirely
different than a pointer in the first place, because
"package.elements" is only valid for a ACPI_TYPE_PACKAGE.

Maybe that wmi_query_block() is always *supposed* to return a
ACPI_TYPE_PACKAGE, but I don't see any such guarantees, and it
obviously happily is returning an ACPI object with a NULL
package.elements.

Some other drivers do seem to check this all, eg
drivers/hwmon/hp-wmi-sensors.c has check_wobj() to verify the thing it
uses, and it does do things like this:

        if (type != ACPI_TYPE_PACKAGE)
                return -EINVAL;

        elem_count = wobj->package.count;
        if (elem_count != last_prop + 1)
                return -EINVAL;

at the very top of the function. So clearly people have either hit
this kind of issue before, or some people have just been more careful.

                 Linus

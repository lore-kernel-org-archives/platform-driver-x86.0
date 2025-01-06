Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898111DE8B3;
	Mon,  6 Jan 2025 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172968; cv=none; b=jegDF8fOHcYbYgfPP5EDghgjGYJcja3rbKbqkuCsIaoTf4vp70YWL30uvGWMCDu4SbasAUpvjMtIWJ51Kox/tsU/oRMMH8jkm8Htbb+VAyn393vvbEEZZWSXlaLShm8kWJMIextQfMeN3IcrsaWrMqV+yP15MwTRbbRxAj5Hq+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172968; c=relaxed/simple;
	bh=1rsdwsuclCpuWIcktKBVvyz9hTrfHnRhLy1N8f0dMAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAmhvNFcKJsPrLejh/EcnNdLR1YY9Nib4of0jVH5xZ8CGTJftgBb/mh3F3ccAuOst9i8WUuQGvLWflsPy/cdtfUcZAReM/KMenSZv5tNaUEMwB3fQgjK45BvG7rvacXJdedeFR7FZP0RfUVPytlQf9WvwsO3iHOumdZHW0gQadM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igLGrMij; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igLGrMij"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5f3397bef34so3357586eaf.0;
        Mon, 06 Jan 2025 06:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736172965; x=1736777765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rsdwsuclCpuWIcktKBVvyz9hTrfHnRhLy1N8f0dMAs=;
        b=igLGrMijrs2sVnTi/UaOwr7yzrfYbXjQsKPGrJJNwufrUA2igrLTUD6+h4DmMlEp3a
         1oHkelijOvh3bGj3p034I5FpTtq20TWjxuIz/hHXWwnGZn18jTdxowrJD4TwCa91Zqm4
         e0jyKIr2iSM83okuVaFjjJ75nlG+1dRsHupq2ohEgLMb5p53HEk7P0pn6lftR/iqyzrq
         ykOxKNzseyB4k3lafsuPQI6Q0enhRC8HIxzglztSC194/KUxVtKnLhTJf2HM2LjLSiH9
         BiGS68Jz33ClOcWjd7RwKfXl3xpPbTsZ2+cabUDY0SqZyQKfLImcQ4MzoB8jMrI9uv5O
         bHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172965; x=1736777765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rsdwsuclCpuWIcktKBVvyz9hTrfHnRhLy1N8f0dMAs=;
        b=gkbknQkDjDorEt8K65zaJRugEFsndm7M3yf8u+BQggjdNKWz3+hv5QDbpFTL61KqA5
         T9eVUWx2HmsYr2ZYsiv7dqmClqGDKZi3Gj2eo4A8aOsTQFjzV+3w66bqDf65WVexW2ju
         NC+6+vOTDrnh05+jDpKF6LajyYgiiybAtfUlo6y4gWwXQD5NqWqx+3htrVW9DiKLlH56
         9Y4mLNfRY6yAlgQJ7sOc8hAdslphWGCKohnj+0OCaNgf8LPDk216rnSIgBJdOv5Ktt2+
         r6ckznwx2pfjzrgBj9VR1zP492E9B91eNF4jwmGNi9rx3Hu5kCoAyQmu3CDrgYAcP59N
         hiMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBXrgxfQ6yxZtV+hqtnEabNA2hSy0vQqqVjs89b3A4L9cN4iaDad+20t+Kn423yg/uOxfSaNjuvVNnZqc=@vger.kernel.org, AJvYcCX6Zt5zRyuN6ZK/d2GM2bGypeWMyemZwL3/MdpdfFniBCzofcmDBwdVuERYhw/Tm4PWISIWmHOm1qDZvr8TNx4TG6ilBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1TAy7WVwke53XJKlHstGr5CML4InyN2Q7M0jf57Hhe36bEPeV
	Gsyqtn9qBuMYScKeo38U4wBNk5MGw6Rr0LaGK2YBPe2G/52CDcu3qkUaRrrpm0kFCQ1qsGxoo6W
	i82a//NL9eEwe9GUB4t8hBOMIcA0=
X-Gm-Gg: ASbGncuBJEXSClLlXQ6nSWBkGYFIWhFGJf3Nq6SDDJvPdjhjoxaFY4qBLl527ur0Duc
	+Oxq3h9mTgMIeVAuGU3kf7YI0ZFNC2Qx7jUxpwHFKyZw8ImLk
X-Google-Smtp-Source: AGHT+IFYNKJH6ZVUYF4I62TDsnTYI+u8oaP3cnPQ4ZdxZVnVvnOxh8NnHSjdaM6u8qB148CqV2whj1k8D11V32LpnHk=
X-Received: by 2002:a05:6870:ff84:b0:29f:d0bb:618e with SMTP id
 586e51a60fabf-2a7fb1ccf9cmr32986898fac.25.1736172965446; Mon, 06 Jan 2025
 06:16:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <051c9272-b466-477d-9b7c-2d3a635053a2@gmx.de>
In-Reply-To: <051c9272-b466-477d-9b7c-2d3a635053a2@gmx.de>
From: jafar akhondali <jafar.akhoondali@gmail.com>
Date: Mon, 6 Jan 2025 17:45:53 +0330
Message-ID: <CAE+bDgdE=2eyy61fM0BqBVP8+tEKYiwZDTUer9y+RdPJZXnA2w@mail.gmail.com>
Subject: Re: acer-wmi WMID_gaming_set_fan_mode() behaviour
To: Armin Wolf <W_Armin@gmx.de>
Cc: Lee Chun-Yi <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
The patch I sent is already 4 years old, and I lost access to the
laptop soon after sending it.
Most of the logic in the code is something I did not fully understand
either, as it was simply converted from de-compiled PredarSense
software (C#) + trial-and-error + checking WMI methods.
The logical flow is roughly as follows:
Have you already tried using this code to switch to automatic mode?

/* Turn off turbo led */
WMID_gaming_set_u64(0x1, ACER_CAP_TURBO_LED);

/* Set FAN mode to auto */
WMID_gaming_set_fan_mode(0x1);

/* Set OC to normal */
WMID_gaming_set_u64(0x5, ACER_CAP_TURBO_OC);
WMID_gaming_set_u64(0x7, ACER_CAP_TURBO_OC);



The WMID_gaming_set_fan_mode function is based on the number of CPU
fans and GPU fans, but it might also be different on newer models.
There are some people that help maintain the turbo functionality for
different laptops and RGB on Github, it might be helpful to discuss it
here as well:
https://github.com/JafarAkhondali/acer-predator-turbo-and-rgb-keyboard-linu=
x-module/issues


On Tue, Dec 24, 2024 at 12:48=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Hi,
>
> i am currently working on adding fan control to support for the acer-wmi =
driver. So far
> i can already control the fans using a hwmon interface, but support for s=
witching between
> manual and automatic mode is missing.
>
> Switching from automatic to manual mode seems to be straight-forward: usi=
ng WMI method 16
> to set the fan speed seems to automatically switch to manual control mode=
.
>
> However switching back to automatic mode uses a different mechanism. Sinc=
e you are the author
> of the WMID_gaming_set_fan_mode() function i wanted to ask you how the fu=
nction exactly works.
>
> In the end i hope to use this function to switch fans back to automatic m=
ode. By the way i also
> found a way to automatically detect the number of CPU and GPU fans for ea=
ch machine, so maybe
> we can get rid of the quirk entries for that.
>
> Thanks,
> Armin Wolf
>

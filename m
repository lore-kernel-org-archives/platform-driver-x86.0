Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D1E43C06B
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830981; cv=pass; b=UcGLPdSEuy2h5WOtKq3h+pYfb6M2s0mlNw6UkZmJjtvNqTJfB3z+eGo0AlIvyTYEL4C4JBhZ7UVAYsYC85I2SwBjM1IPHTZXCt0M+AK2JsC/yk2r9jKVHsJLsbDcv8qiVCRpX4Yk4sYjWS5prPBLtlVakGI9zl9fSvtEnemBY4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830981; c=relaxed/simple;
	bh=R2RLlWKV31uw1vmm0eE8g4HAQBST/y2tQNtzmoB595w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDIxP2O9WTSuKRC6lvhBA6HBUUUPTNwFjDo6S5y5sBknZtPFy4c2GIHdKWpS5pW3Gf655Tr80BjUZW9wZs6U9ZuAk1UTHBdXF54EprFGMtCExdfHl+UGVEBbRU6Y6wH/h3qd4JI5ahQBVOrS9HX8BfqiT+31aP3r05h/KVLXhK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eguBgHH2; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eguBgHH2"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so2107457e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 07:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782830978; cv=none;
        d=google.com; s=arc-20260327;
        b=RzYs27mCd9FB70/ph+d30ZSr1frDYeDwr2SGZRohhsCt+qii/YBJKMzlBkht6qe47y
         0FsgiKgyAZmIENw/BGdOMbKavdCvEWCYQ5iXqerjOfTyMxEcMxM0EQDc1OjVeJsed1Cx
         QrIzMfFqn7lGpkBPmfX6ZHrYcpzGT0rL0mn2p/tm9sNTT1I9CwYWVLu/LqVf/3G3fM8S
         fWwn4mxoECZuoqhaeXCc54lwng/T0tW6I6uZTi4VPbi9MvffKkPYx9wFEyVx/GiiNesr
         XSelAU5+OYsotxDueM20F6hi6NCojiHocTSjOvc6AsYQfc7Xai2QJ6DoPFNKnrXvXxT1
         8NNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BAHFXtMiFS3SQCPXfcc6nAkzBIK1JQ7gQg2BRXU7Bfc=;
        fh=L/fc6X0z3YQVENVdYw32mzuZ5GkX+8xYfxQVVjzVZQs=;
        b=WPtrJlW+V40GGTshkHabUM37m/QoKg5cbFjiedvkbbtzJNRlWLGFX/DhkVrfEEV9vx
         MxxcWf6UiOIMPIKff4VIi7h/tfsbYeIWhwrI/rw17PRDqeyC8V5gd1Cf4q1PG00I+aBA
         +cBicTvGl+stZPezvnQQn/YVFmWIn9B8P8GqEcIuwo1nWejEj84nmgrsWcTI96Qw1H6A
         Hb/V9GrGV8+0Hs7m2YZSrkcrBGDkzM8GLObHcd5UuQKpeVmx1a4rwD+m6NpLjiKeenOS
         XkRO8QITK8BtlYWZ4MkSdMBmqWt8RWvoftquTEL6iMYrTLQAoQrtvrfzXzkkLRCrswHl
         VQ4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782830978; x=1783435778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BAHFXtMiFS3SQCPXfcc6nAkzBIK1JQ7gQg2BRXU7Bfc=;
        b=eguBgHH2CoPRAyRaOi3uiaGSli4ODNgt+uvPY+h/SIbi3UUzw5fgIYyM6JQzztjeNV
         3JlZ/ToxMazHgtcSpYy6Wanx8ZqhDUqqumustyQxJN+22k7vxLd4LMYm7+P0yLfn8pQ9
         JmK4CXxkJxFZX5JST3Z2ucXmDLXruN8OwppFZNOl6Ue/Rze31PgrmjMVcdVChqaVzkn3
         9z6twiYp4Zo1H82GIHWlqKbcTI38vd2yEWEiZYcXIzue3/HMx3mwR50ZIJUVf2D/Y4gU
         v2SGLfGE48Xhlw6IlpE/3my5ZFDfLd1udwdgHT/iCfuo1uBXsQroYQOJpyClQUxBsTNu
         CwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830978; x=1783435778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAHFXtMiFS3SQCPXfcc6nAkzBIK1JQ7gQg2BRXU7Bfc=;
        b=Y8K32HuhzhzhrFVayLzlq7lWoEnmGhJg4/Bhc9MeXPlpRWAFLv6ePM7LcN08VOprn6
         gH2WrhrBhz2oqUYm3YoIKJYd48BfgBVCFH5is6Ek6OSUeykPS9lgm1QP5Rf7MOLvd46c
         TQmIdO6DEX9uss3J+P33F3gYPvPrSF/jHPnnYstq412rI0ulob4TLRYyrTYDaKxlcvHA
         9wBEhiRPtqC+DXuqST1oTP4Pu7LvNLFfurhm1T7LMbgMdRDl1gdhaZq+ZjUvP7+pjenD
         XMy25ArBFhOi1SuvLJq5M70CiGT0JueGtF56NGwcJqGfeFd0UBXIQ3qpeWofj4gbkRnV
         3a3g==
X-Forwarded-Encrypted: i=1; AHgh+RqVG375Gc0FxQzJvp93VfSNxJsgRsm6Tq+NCbTVsN1ROdHobc6tiCxv/V70GZrjozPK8nhVBbVJw2FfnAZPRpy69mK+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+0+bQrowO0KTCkg6yBbYiKbw4zPpRlDHjUeQ0eoFVvIfH8pJ0
	wtLcM1CVz4v+9b8hV159AlwqFaRn4uo7xYyqar0vULOr3FSzJoGudlgvO3xXZOvZunEZdQk1kzy
	bQ/btlN5RttkFDTKYEzsWCjasSlpIeWI=
X-Gm-Gg: AfdE7clZ5hFwJcp0rZe6XjRzkt5EupBlSaguESm+mlGfhImzj4obVcdF0WamUp+E1VR
	7yY/El9p7pSWAJ6LfMpZWCp+aew60aKegwgPiH2EnvqKhU77o6JCg/+1zNPq1k7ZOiRZ7OZDFv9
	Y/8eE73WHpo7NxphPLIPbFm5ZxGUNGatFNT9mlam+c7BpoFU6FDOfGxqEsBStp89Qr8QTXh5bye
	+Ted7rjNOpz97xsFHaKF8ds5Ds2/kvBqDS9/XcBWKH3nlw0PXuaviCv3kNcFlq42NCDcnVspLGv
	4L9XEs743DdYOAQTWTkmCxkqAYLcbPquTmILhz1EWvMsG0yjhLhEA1bNG1ZzQnAzRYA492Hqcqa
	J+3Xk2y5CK5htdQWGBF/n
X-Received: by 2002:a05:6512:640e:b0:5ae:b6cf:2869 with SMTP id
 2adb3069b0e04-5aebdb9485emr981524e87.23.1782830977995; Tue, 30 Jun 2026
 07:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aj5KJEIsTl6IK0nX@gmail.com>
In-Reply-To: <aj5KJEIsTl6IK0nX@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 30 Jun 2026 22:49:00 +0800
X-Gm-Features: AVVi8CeNolHc0bWFWi94se6V_El3cArCALeJfgf0e7sVp8JXgJSa3XDzBUrtcNM
Message-ID: <CAL+tcoA6=_paEdqWaY7-VHdBeAxEFeMCfTECAEGv3C6ZqFUNSw@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] LPC 2026: System Monitoring and Observability Microconference
To: Breno Leitao <leitao@debian.org>
Cc: linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com, 
	linux-mm@kvack.org, iipeace5@gmail.com, gavinguo@igalia.com, 
	linux@jordanrome.com, amscanne@meta.com, sj@kernel.org, gpiccoli@igalia.com, 
	Daniel Gomez <da.gomez@kernel.org>, mfo@igalia.com, platform-driver-x86@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 5:56=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> We are pleased to announce the Call for Proposals (CFP) for another
> edition of  System Monitoring and Observability Microconference, this
> time at the 2026 Linux Plumbers Conference (LPC), taking place in
> Prague, Czechia, from Oct 5-7, 2026.
>
>   https://lpc.events/event/20/sessions/262/
>
> This microconference provides a valuable forum for key engineering areas
> such as:
>
>    - Kernel Health and Runtime Monitoring
>    - Hardware Integration and Error Detection
>    - Correlation of Issues (crashes, stalls, bugs)
>    - Virtualization Stack Monitoring
>    - Memory Management Monitoring and Observability
>    - Anomaly Detection Algorithms for System Behavior
>    - Automated Analysis, Remediation and post mortem analyzes
>
> The purpose of each talk is to share challenges and discuss potential
> improvements. Sessions will last 20 to 30 minutes and aim to encourage
> brainstorming and open dialogue about ongoing issues rather than
> delivering immediate solutions.
>
> The conference acts as both a knowledge-sharing platform and a strategic
> venue for guiding the future of kernel technologies to better meet the
> demands of large-scale infrastructure.
>
> We invite you to submit your proposals here:
>         https://lpc.events/event/20/abstracts/
>
> Please select track "Linux System Monitoring and Observability MC"

A kind reminder: at the bottom of the page [1], please click the
'Submit new abstract' button so that you will be able to quickly
submit a new proposal. (Admittedly, it's a bit easy to miss the entry
especially for the newcomers)

If you have any questions/suggestions/problems, please do not hesitate
to contact Breno or me.

Again, proposals are greatly appreciated :)

[1]: https://lpc.events/event/20/abstracts/

Thanks,
Jason

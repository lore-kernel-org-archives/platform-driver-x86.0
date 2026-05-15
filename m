Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5946A2F7EF4
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778874423; cv=none; b=dCkSv5BKjsjH7its6js83udnqwlKmWtcMTr8vt7G9Vp7C3MbY8UUS1foaMIh0WJ/TMXkvV2nAlkng/WVvK2Fa1kGZFz7AkJ2TL0m/GO4ejGngA+/g1WdpMTIajER+58HoQ47zglI9JXQcdxVFALAujzsSYvoR1n8KhHWfl+m9us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778874423; c=relaxed/simple;
	bh=5Giz3bebreU5H3UhEMEMWm+x4llGJXBFbvSp4jvIkCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NP6sADavfcpr+aIoI/+ZVE+DLb1QiDzvZQA8pUfWu8B6nAlJXHsib1iNHinlhABXd+vLUCmNheqmSXbh4/MTaprA4DFml7+zbBo65ys5J+GmDKhGowqYyoMr7hpSirVZ8XiK/pnXRFCSQUud13Cr5XwQtHXUdIoI+9BjZlIOEFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElfG1nAU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElfG1nAU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba17c8cfacso2599375ad.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 12:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778874414; x=1779479214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Giz3bebreU5H3UhEMEMWm+x4llGJXBFbvSp4jvIkCA=;
        b=ElfG1nAUZ4d6ak5XcTDoaqEcXKo4l4KyhsFydUJl6biJLF6y5InF0NUb4ublrq7DO4
         KAGH4q+BQX7IJxFCLa9swr3Zu5AO+9uo2GuPd/rFqHPmT9g3tKHEIgiHoK2AOy8xgFQP
         JZ67cFH588XLjH/ioNHKBmuyEexULPF+g5pzHeaedf+Gka5oE4utKXy19NfI/W+LRKKW
         V6+pIgKqo1zxogFbvnhpiBseh+zAL3nCws3ruI28IYBcFeS0Xm9igCIUrv+v4PHfCB0U
         5Za+KT35ZlUDwV4/v5i3CdWAmZw8NPMrEInFcxo42J660CVmAoEfuXQlY7tzTgvE8z9X
         oXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778874414; x=1779479214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Giz3bebreU5H3UhEMEMWm+x4llGJXBFbvSp4jvIkCA=;
        b=hmFvc61GH1zD+4MWmTgQogkiXmn6rQdu3tWmfw/M1Zc2hByyMhfps0+u8R9LwqNLLF
         rLDffyMBZBMSyBWs2BtweuPRzpJpc1E6HNF1F3CAH/lWSM01JX3MP1xViM9N+tibJBmM
         WqhBSQrmt2C6FwbsteCLmesOIa/qLAw7LmbN7Pg7Gd96uLFTC4CugZ3/D0Vz5VUewVNZ
         TZdL6lASGu0Vn12bsvcm3mBkQo47G/feLGtBxmwdUkNS+VXRBsOwcYDuZVJ8kHqNPmbf
         ojCMbqOG8eAS95TC4i3kXsxazlqUSRWVPP+lFiv54bZvgBlV/+TsWYyRcvlLR+l+c+at
         me1A==
X-Gm-Message-State: AOJu0Yzm6ZVeSKJTYi2CwiHlJT4+tbryWxkOIjh/TKp3DTt2BlanM5o5
	XUzLdh9vzIvxtnv2VUBeeOkZOQ3/nhvScwMle+Q8R1tqKVkyMDq8URQS
X-Gm-Gg: Acq92OERiq0n6wy16AQ56TcIoDu4RuY+O+zKPXR5sGVho25KQaDF7xs24pHLR60cJ/4
	NWSYGnFeZ/9TMuamEiQ/iTK9cpGCe493ugnLXD1+U+ey/qg/1LfQuvVSBywg4ZG2kqQpBycMgCV
	ZWpA6eFUgxzcypwEm1/BpcWxLJ6iq8RaMHWTtd+TtE+kxRJSfo3146QBz8u4KnoKB1nTdzRe4HY
	bASXfSHFUpK1d+PnVvWmWzYjxu2WKSMtQrvAU8wn087JonKBUCqVDf0PA9qf8oOOW38yoTu2AeN
	skmP+nSDA60wZ6UW3EpUmP7GtwhgPz3prD6mOZew1oQCFgr4zAih3+DhjAnND+uAk7DETf65Kf+
	7cOS8GP9lBZi3N8brAf7+MN60FiMsgNarKmPNZZUXaj4jX/5BSdHAM3tkU3FCw9yUzYsOwZ11Ag
	U3jE8nfo6s2CeKsiQko4VeNbfVibqKjrR4LsA3ZBdga6u7QEi123T2TanhE2tAmpMtJuLEsguwB
	ziXOjq0hroTLmRb8rey
X-Received: by 2002:a17:902:d505:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2bd7e8f0ff3mr59108625ad.28.1778874414551;
        Fri, 15 May 2026 12:46:54 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:bfac:abd3:86cf:47a3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0f94c6sm69843075ad.56.2026.05.15.12.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 12:46:54 -0700 (PDT)
Date: Sat, 16 May 2026 01:16:48 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [Linux Kernel 7.0.7] [hp_wmi] EC layout for board 8C9C
 unsupported
Message-ID: <agd0LPeoD7CVRpbT@archlinux>
References: <CA+ORkNSkzcFwfXhKKN7yFGvUujJKtvOC8jTPYyy0fhFtWUcDuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CA+ORkNSkzcFwfXhKKN7yFGvUujJKtvOC8jTPYyy0fhFtWUcDuQ@mail.gmail.com>

On Fri, May 15, 2026 at 08:45:41AM -0500, Bogdan Nicolae wrote:
>Hi,
>
>With a recent kernel upgrade (7.0.7-arch1-1 #1 SMP PREEMPT_DYNAMIC
>Thu, 14 May 2026 14:26:22 +0000 x86_64 GNU/Linux) I am noticing the
>following line in dmesg:
>hp_wmi: Unknown EC layout for board 8C9C. Thermal profile readback
>will be disabled. Please report this to
>platform-driver-x86@vger.kernel.org
>
>As instructed, I am reporting it

Hi Bogdan Nicolae,

Thanks for reporting. The hp-wmi driver now uses EC reads to determine
current platform profile during driver init in thermal_profile_setup()
and during power source change events in victus_s_powersource_event() as
introduced in commit eeeb4c9874bb ("platform/x86: hp-wmi: Add EC offsets
to read Victus S thermal profile").

At the time of that patch we did not have information about the EC
layout for your board, hence the warning in dmesg.

>in hope it will be supported in the future.

Just to clarify, is everything (apart from platform profile being
defaulted to "balanced" at boot) like power and fan control working
as intended? Because this is supposed to be a mere "warning", not
necessarily implying that something is broken.

>Please let me know if you need further information.
>

Please share your EC dump via:

# modprobe ec_sys
# xxd /sys/kernel/debug/ec/ec0/io

This should be sufficient to build a patch and remove the warning.

>Kind regards,
>Bogdan Nicolae


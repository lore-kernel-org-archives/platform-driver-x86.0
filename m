Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7DD3EA9A
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 Nov 2024 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731829532; cv=none; b=XXa8XilL7BZvHBLr1QvxgddCYqyVZGhWwAt5ZDpqR2n2MmMCZ/SicBGrcFmT1o+/MhuK0+cNxMSSIlHZe5K6LO+oGfbl5Z6ncz8aN/QO5LZi0Rc2T9unRJpMCVZ+Mwd4PDtCg2vijVUriNvo7PeCy0njYc5rcx3jHPnSKic+oLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731829532; c=relaxed/simple;
	bh=h1Ud+lO4X3Rr+rFD/7FeY+2TPcWnC3aIQXyEc0V5ONQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=R5+ayOANR6wbadW+hHT6g3zswQz35ppO3B6JDOOq6/9PO6aX0etPHeazSuByfqu7rk6+jxiVNVRAtusvUMo1LCdB869pBlDmGLegE2hgy46qRliyyvQ0dX36NxVrh9oUS9Gme3Q4y6+Fsz2N1VhhIXGWA8HUGBDXByHCl3gUIMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6U1f4R5; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6U1f4R5"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ea9739647bso2301453a12.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 23:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731829530; x=1732434330; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:reply-to:cc:content-language
         :to:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXmZGUQ9dv8Dh9JxxY5+T1DeE82tU9ToyglJs0admA8=;
        b=T6U1f4R5rmRG83+eTpSUcRO9B3beTDfnna+0O8fBM00ZrZ0ASlAI3OXYd2NYOPKCPb
         P0KLeHtQDVgsMyB7AtbmUnACECL02O/NDSrJuPMV6TFdSyHWXsOD1SkHuPfSMy4v2MJB
         YN8qSSNCIo9Q8u08OQKZjrPVn46Rvdo49ennf/5NjelUwSYbgtp/SGON9hbRCchJOeQM
         O07CiObwKBtsEi8lieCJEubDxPXvMx3nPeGvK7NF05rUNqmyNL/Ou+VvZSzzTmxN2/cG
         N0CGkxjShRt2nZaJP3Mv239YCfVovWsjxe7bkglA4HqBTImFrUI5YVQaa9IsQCdDak3J
         IkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731829530; x=1732434330;
        h=content-transfer-encoding:subject:from:reply-to:cc:content-language
         :to:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXmZGUQ9dv8Dh9JxxY5+T1DeE82tU9ToyglJs0admA8=;
        b=shQ6sPu/T6JauYSBnnKU0Fu43On+F334vQbhDtDQ9JKLOndyAlDjeo20qvNI38sHnp
         AKQ3Z0p3bBX7leoV+OqUVU4fPqGmvB52StoftAVXT1naIdS6cyU8kOn5WcLJCzBpYWdt
         DxyemjsKJyPp76k62IeUGQ6UuLHrNUgO/BIKpGdiNQnRoHA7HikEnkU8U3CgiYw/FjW/
         IJ1CJCV09XS7QchZPM5pmyejLXUVV5qt47tt8sIXw9y0XaSiWajItkmNSdyEH8fS5Mqc
         1vxTXySeO3UuzZgE6U744LEE4LA4O84knHEBIR4Aqakied3hNpreYfOkLygG9f5zKGnM
         AQCw==
X-Gm-Message-State: AOJu0YwxeR5CzGPGdNuTuyHrEdVhkvCr6zqx8P6EGc++D7yo9D+WGgYw
	+yH8f2RmA91drwIDrXtkgzA0lwy2WnuMpLGoLU3jRm6hLG/n8HzM
X-Google-Smtp-Source: AGHT+IFyDCaBEJrOavGWv3+9OEtnHgUGA3LpyJOYdM2E4/wANmOKJ1hCjipGVguqJB9ynp3Q/fZ3dA==
X-Received: by 2002:a17:902:f651:b0:20d:345a:9641 with SMTP id d9443c01a7336-211d0d8444cmr115122895ad.27.1731829530486;
        Sat, 16 Nov 2024 23:45:30 -0800 (PST)
Received: from ?IPV6:2403:a080:c04:9c06:a330:1453:5c70:849b? ([2403:a080:c04:9c06:a330:1453:5c70:849b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06f9c677sm5991764a91.36.2024.11.16.23.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 23:45:30 -0800 (PST)
Sender: Farhan A <farhananwar8@gmail.com>
Message-ID: <2ffb529d-e7c8-4026-a3b8-120c8e7afec8@gmail.com>
Date: Sun, 17 Nov 2024 13:15:26 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: w_armin@gmx.de
Content-Language: en-US
Cc: platform-driver-x86@vger.kernel.org, rayanmargham4@gmail.com
Reply-To: bbc42008-f121-4710-a27d-f32b9deabcac@gmx.de
From: Farhan Anwar <farhan.anwar8@gmail.com>
Subject: Re: Add Support for the Acer Predator Triton PT14-51
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Although I'm using Swift SFG14-41, I have noticed the same events on my laptop as well.

Connect AC adapter    : acer_wmi: Unknown function number - 8 - 1
Disconnect AC adapter : acer_wmi: Unknown function number - 8 - 0

The event for disconnection is printed twice.
I've also noticed following message occasionally along with these events.

workqueue: acpi_os_execute_deferred hogged CPU for >13333us 19 times, consider switching to WQ_UNBOUND

Kernel version: 6.11.0-9-generic

Thanks,
Farhan


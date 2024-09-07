Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9534015CD41
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Sep 2024 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725717875; cv=none; b=lvkC0ApNSheYvQeqBVq0l4biBn5199s5Q/pr0ypViw9bLSTkxdQ69P2i0KrdtphEAZZdcml+KnVDGsYyR7Q81wKtQnsg281uva/X65U0Q11c10dc/Rh7bn7Ziyml0K7UVvGtkPq4AP0YYXoq58EBKclegPxeEgSjnm+T4bbnEv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725717875; c=relaxed/simple;
	bh=fn/8FW15s9ERu3jatoBEkUVxfsNvhJzurlSzY8U8LPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edKGRWtXPpfkFa2dw6rV074OtSl+Eq0W1x4RJBLtnV46yq7UB7vqdkiXcVu2WXIxlt2eFr9YGHjboBKAFnP9KdIz6dKGEwk/L3cwoHB2WAn27Kh3wkhtpP2VamcwocKSjJWdGBzFAb1tZaFVAr1rOzmqYMqBoCb2nME+Dbm223M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmO7u7Sx; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmO7u7Sx"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5e16cb56d4aso1585644eaf.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Sep 2024 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725717873; x=1726322673; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fn/8FW15s9ERu3jatoBEkUVxfsNvhJzurlSzY8U8LPU=;
        b=fmO7u7SxVWJ8Q2gCvRm7t5DGl0mUtwgV2Kn4O0H66gG+R790f9VObp8VOq94wLLHRM
         PJovaK44vOahDYU4pfwIlRlrITQdD0ypxDqfdzVSFtwzMn6WeL9usYv2PryrIJzvrEtF
         Gwj9tPYsiLICzJeYaAQv5BwjcRqQP3WCKr/4EzerGQONs2snwI6akqoKuPQ9u6DyApIG
         MedGJt5iI1/r2WpQp+juSqUCNG5OQB45ttfiZIKQQ6232UY+zrYXRCXAvQGL+RnfV1v0
         hu/G6HLfP0XR5cw32MCt3c7KVtfdI12S06S/KLFYemrNJtK9hTJAUduaRnBTe1So7tUU
         C3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725717873; x=1726322673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fn/8FW15s9ERu3jatoBEkUVxfsNvhJzurlSzY8U8LPU=;
        b=U1ffezyTsSimf/NPyQB99HDWTEch6hQualjgvDcHQcnz4+dfriuzZ2BS0mExTP96dp
         F3rUjDMwwm4ztc+0NwIu6owOjrfm6swAikqBoYQrewZKzfiPp+FNsPDNE6TX7tMI3VuJ
         v2zX5GLt4leHqfnOcwWdm7Vv/0R/wNYk8+T3iiiAVzOR397Yl6M1n9qsqvMxUDRhBr2j
         iRe4gyU18b0ponUM+Tj/5TLbKsS36DDdWZjIobB7QESfgaIci2kejK1FISyDf7U1cmuw
         tsLrNpXA8c32I+MzDSvjktqFps+rbr8nKlo+bjkWbx8X1hvcWE64ukRzhnVFg3CDCUom
         q9PA==
X-Gm-Message-State: AOJu0Yxysj6vN6TYNF1eQhEyZ+byLiAgL8AYjOMQYUnPUYn3kFpI4dWS
	N/XubTdLmewS1WDz5yO3UMH9Az59QbY6LMV9trdccKcGeBPHDOUCXSk5ktpF14OvFLwR3wuC7Wd
	VpHxCc/jVPySemT8ETIbONkjd2D0=
X-Google-Smtp-Source: AGHT+IEjfwzR7IDYSsrWhLnhymeAMNC76dOeBTcMSgIJ4CZ4qZcEDxublY+IAehFdcIg7yz0hZo9bmOhb3FyxswVOAc=
X-Received: by 2002:a05:6808:1396:b0:3db:1735:9a41 with SMTP id
 5614622812f47-3e029dfd167mr6679241b6e.19.1725717873552; Sat, 07 Sep 2024
 07:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3c63701c-f9fc-4f98-b991-58135da3fcc3@gmx.de> <62891F43-E938-4DF3-9E51-9CCE19784DA8@gmail.com>
 <d8563b6b-8ab8-481d-aeba-656c38dda2ed@gmx.de>
In-Reply-To: <d8563b6b-8ab8-481d-aeba-656c38dda2ed@gmx.de>
From: Rayan Margham <rayanmargham4@gmail.com>
Date: Sat, 7 Sep 2024 15:04:22 +0100
Message-ID: <CACzB==5oz3xa9ZFRk_xF8qDpzvKQcdjpKTx1mvUENkkZvLea-Q@mail.gmail.com>
Subject: Re: Add Support for the Acer Predator Triton PT14-51
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey Armin Wolf,

I found something that might me quite helpful,
4,1289,478717534,-;acer_wmi: Unknown function number - 9 - 0
4,1290,478733471,-;acer_wmi: Unknown function number - 8 - 0
4,1291,1751600805,-;acer_wmi: Unknown function number - 9 - 1
4,1292,1751612580,-;acer_wmi: Unknown function number - 8 - 1

Thanks,
Rayan Margham

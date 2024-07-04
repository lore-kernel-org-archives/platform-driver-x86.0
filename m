Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148E13BADF
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jul 2024 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720098437; cv=none; b=q72+9bDrJL02BOiSqY07nFX/yjVQYjH1Ei6KQWuOj+gs3qJt2RHDODWauLCSRplma6OYtokCQIYhVE5fJswdWBwTczSumuaIw2X5VnOVmPHIMrNbwbozI9GPVqkBpfGchX2za+Hg675tMkYkKq4rbYnxyQC8rw9gf68Vn9CXMZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720098437; c=relaxed/simple;
	bh=SctyzHhEpvQYkpqbYkYxNspdRRbz4yH9gYPXXglV6Ns=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=acDA5UnweGC7b9bcNaXcv5dHVMu6wKKSDRhZ0gQMPTQJcatXN4zEAnE2Lak/B2VUWzQaytsnUtkvhDK+/LKP0nwuJVYjlpqsEaxjMWE6qgYW2wC+d8XDJr7tSuyoZW6kQq2xcd68Hspo90smor7t1cZlW6/0gxPoAhELBzxMcPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q/2sqAdu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q/2sqAdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720098434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rr5UKMrUGkjJYiUKKYb5e8+Q4alDGlhVFcwMM1toc3Y=;
	b=Q/2sqAdutQ+NorqxOUXMyRYMKSR3Rfd0i5jlyw06QDn3N+fKLCXqWjOw0FyHOirVhTRLvw
	CWeqDYO/f6mbndP/6BfJJrZjyHaRwLm/718rcF7Bh5eqrhgqCoZB72mFq0ethBX+yCskTv
	JKyskRV9LxzajEYnLnZelUCBd2vEFnY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-aYNVK4jMMPOdCVzFz-j4nw-1; Thu, 04 Jul 2024 09:07:13 -0400
X-MC-Unique: aYNVK4jMMPOdCVzFz-j4nw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-57d5467c427so603733a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Jul 2024 06:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720098432; x=1720703232;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rr5UKMrUGkjJYiUKKYb5e8+Q4alDGlhVFcwMM1toc3Y=;
        b=nnetvr5pm/I1cmWUxmbj68sdjhx/qFlFWTz58YvjIcN4T9ZnXkY1zBQtJteD7coG3c
         RIDXRsMJh+Xi7KAVS2tpjjt69nwPyQbwxvSryxeiP5P6TiwtybFrVtDc6Wx7eQUjY7ro
         WvccwE42wOYInwv72RLkVdOdITr1dbqVjiKgC+xc5ePuKp//NvvAtAT+OuGH3bgDfmdH
         YDWth1RfPHTl6wXWb9CSs7IfhgCx+qtfprkAYTGf8keMjj0PJFEwllGY3CVmRf33cT7G
         DmTB3EMdxS+W4b12c6vRouUjjQm8ZRbdIXdhNi5nXvXcaBRh+rYLi0gfaCHAjYFNZS9z
         lS9A==
X-Forwarded-Encrypted: i=1; AJvYcCX1RySZagLGA2nFzXLGvLHvDd8i+EC3Sj5kTsUcbNkp5ALzNma19Xl9rOpCX7zMMUCzjprJtUakrZHQkwdzi7Lw6VA9H1F6HVPKQRi5NmU2fWm3kQ==
X-Gm-Message-State: AOJu0YzSMoP7mRnnrpfrC5mAnuL6g+4FmEqOcAeyZDWSd51irZ7On5s1
	895iAbWjC41rRhupMAY6BpP7TvLPERkkbKCwjVah8vcs+SKfTCxlmY4bnyQtfE3mQJqn6xp7UVE
	SC/DEsqihR+gY4khXmbJWKH6uOk9OzZBZcq5zaRrg9qwT7zbm3BVpbasbZU4ijihtA1uU/Z8=
X-Received: by 2002:a17:907:3f1d:b0:a6f:bae6:f56c with SMTP id a640c23a62f3a-a77ba460b68mr119136866b.3.1720098432276;
        Thu, 04 Jul 2024 06:07:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLaQAe30WMvfZKaAWc99XjUUuw3odz3gTOq/73LF5X0dy2EwygPq+G0nwt2hNVYycpwy9afg==
X-Received: by 2002:a17:907:3f1d:b0:a6f:bae6:f56c with SMTP id a640c23a62f3a-a77ba460b68mr119134666b.3.1720098431820;
        Thu, 04 Jul 2024 06:07:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab065187sm599306866b.139.2024.07.04.06.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 06:07:11 -0700 (PDT)
Message-ID: <acea1e0e-995c-4aae-aefd-e8fc11d20d80@redhat.com>
Date: Thu, 4 Jul 2024 15:07:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] platform-drivers-x86 for 6.10-5
From: Hans de Goede <hdegoede@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>
References: <1cf4578a-3499-47e2-85de-03887de1f05f@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <1cf4578a-3499-47e2-85de-03887de1f05f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/4/24 3:05 PM, Hans de Goede wrote:
> Hi Linus,
> 
> Here is (hopefully) the last platform-drivers-x86 fixes pull-request
> for 6.10.
> 
> This contains a single fix for a regression in toshiba_acpi introduced
> in 6.10-rc1.
> 
> Highlights:
>  -  Fix lg-laptop driver not working with 2024 LG laptop models
>  -  Add missing MODULE_DESCRIPTION() macros to various modules
>  -  nvsw-sn2201: Add check for platform_device_add_resources

Ugh, these highlights are from the previous platform-drivers-x86-v6.10-4
pull-request and I forgot to delete them, please ignore.

Regards,
 
Hans




> The following changes since commit 7add1ee34692aabd146b86a8e88abad843ed6659:
> 
>   platform/x86: add missing MODULE_DESCRIPTION() macros (2024-06-24 13:33:20 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.10-5
> 
> for you to fetch changes up to e527a6127223b644e0a27b44f4b16e16eb6c7f0a:
> 
>   platform/x86: toshiba_acpi: Fix quickstart quirk handling (2024-07-02 16:01:45 +0200)
> 
> ----------------------------------------------------------------
> platform-drivers-x86 for v6.10-5
> 
> Highlights:
>  -  Fix regression in toshiba_acpi introduced in 6.10-rc1
> 
> The following is an automated git shortlog grouped by driver:
> 
> toshiba_acpi:
>  -  Fix quickstart quirk handling
> 
> ----------------------------------------------------------------
> Armin Wolf (1):
>       platform/x86: toshiba_acpi: Fix quickstart quirk handling
> 
>  drivers/platform/x86/toshiba_acpi.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 


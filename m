Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FE434A79E
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Apr 2026 23:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776899542; cv=none; b=RuRfmd4apaNGOHBqgFL9ya3ei4DBI+vhEYqDr1VYTdlNUcpp/sic+q2M4bxvUAyNUHVPu/Cqz9115Qf3P4jnSinB5J0pxQoSIBJ8pgMY2tiHICCYMVce5e2PiIjG+lf2mz7cmaJLRg3LRwzKWBjCmev+C/Dh+FUcbmQ7CKDIMIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776899542; c=relaxed/simple;
	bh=mfIiuVCaJ0doe0BpVyTd00QdMLM3sKBxSP/qcyHaIF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvTI7wtHcWXw48fcShPvMioolFqvfOLjMoDiMMcq2qROg30zePewBDvNQ03iP59Kk0rreYkYQfU5ekYpKtzigxAmrQNtVgQa+FAMe4RtSmHqxte0Vf9Xk3G0XZwS/3GzqS6loGfKUIA6NQ4wUwSIP8y0TrQDfM96mLiWTH/dyEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjsUMr6K; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjsUMr6K"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c726ef332so8410607c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Apr 2026 16:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776899540; x=1777504340; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MfGZmLeYCrgfhjzyTogBmupcTqoeQB4zrfHRK/dPQpw=;
        b=YjsUMr6KMKzcGF7E61nYNTdxJBEl5h5QKFMJlY6ROLi3oX+OGRqzC5CvesnHXCaxK9
         u9vlNpeoZpW7gyZaJ3dFP1HVbCdX2GezFtQk86VlYKGO0NFGpzWVeLLBrJbjQ3ZMxy3w
         +rj52zxmyctxQh7G/ukV/sobAsEIvtBH7Nsxur++02UAtbm7cBwfwjHMdcbN3C2xxFxW
         m1TpL/K8erWu8RPJGC0J/KuEUdC6IS08qgGjUtwQ8GU2UssCZejRH7DtUgaNzzwU0CPO
         kiI/zaT0rG/KOq9LAlo/3MFDdrqqmTZHP7WHuFZppVcRwZ3EV4w9Tq61qdU9La5djGO7
         /gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776899540; x=1777504340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfGZmLeYCrgfhjzyTogBmupcTqoeQB4zrfHRK/dPQpw=;
        b=a+XaP3QXsh3TKpBy+M2bGUIr67cMHW4e1D7y6s0QH9FcR6xKD8TfIHp5e0mCnX2KNV
         qkA+qKRGG2JzNz0TfUljqeehQF0pC2jGHaHq9Qv874j0LucpGwe4XFJA6Ff0C+SyFYRS
         QPz4hdJGEHk+hfVT/CPy+kHWu5QObVOo0NJaTDE14NE/+rFrhXt+ScwV80JwCCJ8KawM
         yA31noRmW6KRuutdbTC+bgLHcxm0lKujOvPIBbgLzhe8bOzB8ekGYBJ+E56E7ybhWKqm
         qOPMEQ1aNGsD37v4EPc0KrSmLavSUy/A2Mx4jAfNbnfxr2mA4UBHnXI0N4kNEwGTdGCf
         dH9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Lnr4VmD68oI3J+iZneK3lmy6gsxyWgMtLtQCIrgsquwexn5gOrwwlmW+iXDcS6OGkeDmdb3AxXg2ZZnBBb7/A4GVZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXqFta/yfcyOjucO8rsTFzJqNj1jMvK7gMj2rPc7+IQZvhkue
	MzfqsnvGhp19DDUaoYSybRPzwHd4OGNgrDjHIZUGjbL00K8vIQT+0cdr
X-Gm-Gg: AeBDievm64O1Vs8bKSFqiZMdwmI9TEt7ZHQ5AVpGbAvgxHKwn/mid4F+EBNCFLkPkxV
	vJwl1TwqLXuagBxAldeswem89q09ELzyk2s7ph1oDEMeZfmjrfPmv3UPXuU5mkrAuu9EpSRKdvL
	7yrTwIiRRakrXtg8yRD7IpbtbUNulaAOWcSOna7Qe9OXPBqQ/iWlmllIuJzuf8x/N/in2y53wm5
	5TrfBDzL8t20OfIBBNbMSkzAbrKevLW82d+ib5FU9q5WRYFzZewFVl0lnV3dNE6j7C9A4bH5FV/
	TiI2OnaeU2PJQG3RLnJywJ0h7SjFPC2uA6N4KF+rV7f+tAw87WwjAmHwtspwj9d8aQx36gc5EUQ
	6JqeT3ZDEfbh0fsVMkjl0f99lEBRSy8QXpv/9c5OhrW9VRFddudipN4xjMsbXzSmERLz/yHeH3p
	Ij4ZmI3kYa/+cfar7Zqa6edX4trJEk+i+KaFtmKOyZR1y5F1dO
X-Received: by 2002:a05:7022:6289:b0:128:d9a1:b68b with SMTP id a92af1059eb24-12c73fb1e29mr12963523c88.33.1776899539891;
        Wed, 22 Apr 2026 16:12:19 -0700 (PDT)
Received: from localhost ([2804:14c:5bc6:8c1b:1d0a:389e:9b35:e8a9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm37845814c88.10.2026.04.22.16.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 16:12:19 -0700 (PDT)
Date: Wed, 22 Apr 2026 20:12:16 -0300
From: =?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-wmi: fix camera key led on Zenbook S14
Message-ID: <aelV0GZ8n5s9lXOf@djouze-zen>
References: <acxSW8FgXbnFiqIL@djouze-zen>
 <ac6xgsMxzpnU_8FA@djouze-zen>
 <7db8d74a-e250-d790-aaca-d02a08a7c091@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7db8d74a-e250-d790-aaca-d02a08a7c091@linux.intel.com>

On Thu, Apr 09, 2026 at 03:45:29PM +0300, Ilpo Järvinen wrote:
> 
> Please just send a new version. It will be much easier for me when I don't 
> need to hunt down odd spaces or do multi-line code edits.

Sure, I sent the PATCH v2 a few days ago. I look forward for any
feedback. Here is the link in case something went wrong and it did not
arrive correctly, or if it just got lost amidst this rather busy list:

https://lore.kernel.org/platform-driver-x86/adg6GzkykThAB_4u@djouze-zen/

Thank you for your time, and sorry for any inconvenience.

Best regards,
José Rodrigues

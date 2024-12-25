Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30208836;
	Wed, 25 Dec 2024 05:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735104333; cv=none; b=U6i14NSRecK97k53mOCpdpwYI+Vdo1p0A/NQgAjZqjs5vAoIlRRjOwvihC4Cl1+YzYP/X7iDXjvXO41T4Va5fwNr5M+3CIkySvQpW94Z3tLxI3xLPkFHSTHJqp+A3aYHT17ZBi8DvknzeywGjCYCY51KP3EzKb8sNdC8+e/6cA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735104333; c=relaxed/simple;
	bh=t/6Snv+hrHU7DcJvm52OGvB2JcaV+sv3YhVeDf+8aLM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YDmpEtZbyDyqiW4wYTfCdlu9Vj19C6woJFCiQvPFZN514ZnN1aTb40PhO0wrehbZS7s1fdUT0KvKqpuy7sA1BDfvtPD1IYuWejwz9Nwo+vmZCRkPnPC2OqWpK0+MKzPR6VjDmvPCucOySspVa90+MOnLmWCFWD0VMxhTU+HAkvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hE02gvR4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hE02gvR4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2167141dfa1so58628405ad.1;
        Tue, 24 Dec 2024 21:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735104331; x=1735709131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8xa5H/OkZhrUiCHSwO04Buw6PHy8pZHZkLKIrBY5RWE=;
        b=hE02gvR4fmgpOcIOdAmLAa46JBP9/KakEFnE/+Gh93EySEZklJHrtJdY2iD82wL2YN
         q840yHmgJFzaPYK1mNYpHGaCL5Z7M6KH5WL+5vEeXOD0lIV2IG/skEvT3wBY6XhwxXOr
         6B5EKhJa2ucyBpxcbGFRoBvxOJTucpnOrI3Y9lI9bphL8p6AyKnNBe5RCmewkHgmzIjZ
         4yHJkWItnsUzc/kAhtEstNxxLohyVazI/dNYzCF8mO4u7tw/C5jcFe5WL7VrI2xT0JJX
         SAXq5IYEzD1F5vNzA/hrgxOp7Qer5jv72BPBQsAQoHFoRwz0A5t7XpvX48UFVhHY6vDT
         gK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735104331; x=1735709131;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xa5H/OkZhrUiCHSwO04Buw6PHy8pZHZkLKIrBY5RWE=;
        b=oftSGDIUus8HVXZeL8TPN/AbS14uyPLivHURYVMgF76HfbnuXd50M7HkIBJU2s36HD
         bVIrw6iMAnViys+ZRRTUDPMguooIX50mPp4ggj3/eM4Ilktj/bRMN3k3wPVn8mBwYYtx
         YyFI/+0gJhpdarzfajv38KcpCXmKdqzydMAr1jAzSxe0qouLE3iRM1eAPyNB/I+GY4Bq
         XWrYM97KiY2O3lvsklJgUdhso0f9+i4PhYO07eOvP3O0Wcll9ssQwZc6FZ1at4kp31PM
         f0BXRLyLdX665AuoO8rPDBK0FU6EJzubw3A8d64mjvaoH+Sw47CWCC7yTm17CVRbyYkU
         l+5w==
X-Forwarded-Encrypted: i=1; AJvYcCU/yR41iDtd+nsZ3LKAU2e7NKyUaYDdLAwFkxSunV9MTX0wc7vyXeHly+MJM3osONv6yiwaZeYg/Xc=@vger.kernel.org, AJvYcCUdtj6pmUwLMS7euWAhyRCwqRCZhpmNE2OZ4ntrcuuS3Jm92hsJ7JbdW8tj+w7LVRpH9s/ta4NqGtcjXQeefbLbDG/vPA==@vger.kernel.org, AJvYcCX/RtBsUctqSoUEazbWz6u14EklkYd30LyWzavv3/5GDiLgoknAVz0UOzdYNGDOMVi/QBI2qmJTxNB3cUtQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy01vLhO9f0ZVvnNZv7uix4QLX8EGnq+xFEWuA0NsU/MoiLYs+2
	qs5lRSY7f8EStY6AUF4cxc5Nsmvcmk2XeXt/aoaI6qEAvFX+W+yd
X-Gm-Gg: ASbGnctamDEe4T6zezrupOjW2dJYo9L2KVF/IjMWZLJ5gnRxOuBqxHLtqq2sNYy4qyx
	ijdhr7byWLEJVhOeLq3moOyx8irCMcmT6Rznm+QMkm7wdciNQeJU4qg91xIxCwCxepOYAw/rGeq
	UIPzPQvmFzYFn3Iv9rxAirzF0N/dEvmp7y3FGTwHTZxWS1AWVBu+l/NKV341OghXPIfjKoJHDOt
	0lxoNpjXgUO707EgBjSo49b36JSPhdP/wYjpQ7xIcDMwqftd6VL/HOb2OIxGWfut/Qa8QgW
X-Google-Smtp-Source: AGHT+IEEmNKKJNokZaDfW4qUganR1dAKsAWwen2qB8IV9kDVidKs7Dkg35bcxUOs0OeX8mjjFLINHw==
X-Received: by 2002:a17:903:32c1:b0:215:7287:67bb with SMTP id d9443c01a7336-219e6bf8c37mr254385365ad.0.1735104330917;
        Tue, 24 Dec 2024 21:25:30 -0800 (PST)
Received: from [192.168.1.94] ([116.206.160.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde66sm98204375ad.145.2024.12.24.21.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 21:25:30 -0800 (PST)
Message-ID: <7b1d0298-4cdd-4af7-83e6-9e6287387477@gmail.com>
Date: Wed, 25 Dec 2024 18:25:19 +1300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Cody T.-H. Chiu" <codyit@gmail.com>
Subject: Re: [PATCH 1/1] platform/x86: Add lenovo-legion-wmi drivers
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, ike.pan@canonical.com
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241217230645.15027-1-derekjohn.clark@gmail.com>
 <20241217230645.15027-2-derekjohn.clark@gmail.com>
Content-Language: en-US
In-Reply-To: <20241217230645.15027-2-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/17/2024 17:06, Derek J. Clark wrote:
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> ...
> +config LEGION_OTHER_WMI
> +	tristate "Lenovo Legion Other Method WMI Driver"
> +	depends on LEGION_GAMEZONE_WMI
> +	depends on LEGION_DATA_01_WMI
> +	select FW_ATTR_CLASS
> +	help
> +	  Say Y here if you have a WMI aware Lenovo Legion device and would 
like to use the
> +	  firmware_attributes API to control various tunable settings 
typically exposed by
> +	  Lenovo software in Windows.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo_legion_wmi_other.
> +
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI

Hi Derek,

Thank you for the initiative, love to see we'll finally get a driver 
developed with the help of official specs.

Perhaps it's common knowledge to the crowd here but I'd like to call out 
right now significant portion of the support on Legion ACPI / WMI came 
from ideapad-laptop which explicitly detects it:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/ideapad-laptop.c?h=v6.13-rc4#n2108

Per my observation majority of users have no idea this is the case 
because of the misnomer, adding another set of drivers with Legion in 
the name explicitly, that don't support those features would double the 
dissonance.

I wonder if reconciling this is in your planned scope? If not IMO at 
least this should be called out in documentation / Kconfig.

PS: I'm a developer myself but at lower level kernel domain I'm just a 
user so hopefully I'm not just adding noise here.

- Cody

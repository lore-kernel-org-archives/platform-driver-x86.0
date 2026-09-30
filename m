Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283A4196C7C
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744784; cv=none; b=BHKDGySVQqH05sKxpCkFCGI9Sha6jDfifwZ+GnhqFxo6YPIynvc7jeQfHOM+cnBqvfqQ8ASduWJBnAOVeeZRUiVsITVv0IIyf9tIWxzZI0RCQA4CRf+9QKy0N3pADIoUMx8hoDOHNAU7Bi0c55AbnCC/Fnh2qhwkFWY+11E5F2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744784; c=relaxed/simple;
	bh=zYSUmldqZNFN7H3/a5usElfEPj3ThsKq72A1iZOzhBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWsIf6H+mqar0iZ7VPlaEngak3ZaDpr2DMQKDt+YeU+qLrvOodp0p8Cj0AMqLrz3TCfNXXnPuhSXC5isrrqji4PSFjfNgUX1i6R2r9XJrH+kNGVdUgyAAvxU3Buo1ZpHA3xx9hWbeZy0y4laBNhJWFhNFtz25IPaEOXOHkWyuYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WerGsb2v; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WerGsb2v"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso972494eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 22:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744782; x=1791349582; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAgL0Mi0+sX1VGlcOpnZQYafcet3pBZW3SXrknQHEys=;
        b=WerGsb2vgJFYwiDL0Dh05AiSvxmcpVlD3EnLzAs3mlxh6PH4jJHORbxGXNGTBvCkRM
         6/q987R7t8rCTDWyubF2d12SdZHnrrgfeiEvZeQVevDacRY2cim3TzvHlQ4pF8Sr5ev2
         kCc+TrNw4+zYUX+G/lUUJltkQEsC3y6FWeVhwppMMAH6OPgDJQ61wNOQ4fPoyMI9lC/J
         oBj2I9gSgFJX4fVa2JCl9P7Dd0oe6yr17r84VIC+kJOkiEiMDMaf5RpdjHDhFJGlvTtY
         Cc0fCC94K0ZaYpWXUmqkgUWRXdOQfHCAodCXVdSPuRP/xoHyVZP1XKWJryoBQcXJsg3j
         JSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744782; x=1791349582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sAgL0Mi0+sX1VGlcOpnZQYafcet3pBZW3SXrknQHEys=;
        b=NmmSxnNXOiaUNeRR3zTLMX1O2tFkIeNA7IKdKjZw/xjQBUoE/aqeyKHqh5yvbbYElz
         3WmSJE01jFtfPbotWDeg1pibmLbeMx+SaR44yH/y50RkOMaV5WnnvWYU2d8D8vRlQnhG
         AnUvSYwfB9IVU//PTwV1SbOKza63d94y/oyHHUbWHLFjq5SaVR6QfsBybhxyyrb/UAPk
         9ZRZM38ig94dZXgw2seyqkKafTyClr3FwEbFznDCVksRwraXjrb00fjlnCnaBo6njnww
         Q4H4DNocMToWhL/hU82isyVQbCYzByrnt7WbErVD/pXCPTfa13unqPziztDDeR01SkDm
         cMjQ==
X-Forwarded-Encrypted: i=1; AKwUvByYrVFiLnlAlGGscgoSWTsQLa+8/7nOMjKRJRuC2bD2dhf8gprNa3L7NapL+XW60SANvrZ7e1xZAJdj2BOA0O670i44@vger.kernel.org
X-Gm-Message-State: AFq9FYLFbKudY77mwp90VG5ECJv6zatAbRV7mudmawHWMu32CEZfv0+k
	ykb2N+8B+V2difQycUVh9LRqetH7TrZDYLDjxKt18KYkv6l67Tq3Xm6A
X-Gm-Gg: AYBFou3yjqKmbVTcSdszOOBoQrVRRfBnUACtuSEb9SssCk2a5cEBwqv9rSS+I4Fc5oX
	pLz5bwFp30zxsy661g8oHTAs5pjYMAaUqkT14XjXhdtzFTHTksReRTd+fEGZR7VJ7S1sl/zyviS
	dkODzsTHkTcSD97eTPqGwUIyXb7uaGKWXZaXSLNnVJs0jSG9db4mEhqYzOqwAxKnjlJSaD+tXTT
	V1P3eXQ3qQUcUmZeeFLXontej7hTYlgYuOlb2tUrXjTkM8ZAkiyuhwhgeyEtB+XF5gs20V4jqXU
	z02Kj5e2JgtKNjyem0Q1VFlo10vEIEyaNZjhcY6mbK/jJo2aFuTBTFwGUSatv636+PS7wk6Pml5
	otWuG3cOMlvJZIqP+we829gzm7uQkkt0ugyPgpTr85DTswmESq/sWQ4pyvrJmt61qNBifCJCI9T
	W1iDQX7JoRnafOF2LHYFk/g6i270g1YmAl+vuDeMqTq9C31OV2icF515PxRezHj5yl5QH7PXl5c
	2V5Om3tlXCT5JFGKmdfUlEG0D4XPsSEqtcRSlac
X-Received: by 2002:a05:7301:92a:b0:33c:e9d:6d49 with SMTP id 5a478bee46e88-34ce170a6d3mr413680eec.39.1790744781935;
        Tue, 29 Sep 2026 22:06:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf22f97cdsm959454eec.1.2026.09.29.22.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:06:20 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:06:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Hans de Goede <hansg@kernel.org>, Nitin Joshi <nitjoshi@gmail.com>, 
	platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] platform/x86: thinkpad_acpi: convert mutex_lock() to
 guard(mutex)
Message-ID: <aryYOI92NRUGT-4F@google.com>
References: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
 <15bd7fc2-ea2c-95fe-330f-6dcb005239c9@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15bd7fc2-ea2c-95fe-330f-6dcb005239c9@linux.intel.com>

Hi Ilpo,

On Tue, Sep 15, 2026 at 02:33:27PM +0300, Ilpo Järvinen wrote:
> On Wed, 5 Aug 2026, Dmitry Torokhov wrote:
> 
> > Convert straightforward mutex_lock() and mutex_unlock() usages for
> > hotkey_mutex, tpacpi_inputdev_send_mutex, kbdlight_mutex, lcdshadow_dev
> > lock, and dytc_mutex to guard(mutex) and scoped_guard(mutex) helpers
> > from linux/cleanup.h.
> > 
> > This improves code readability and ensures that mutexes are
> > automatically released when exiting their respective scopes.
> > 
> > Assisted-by: Antigravity:gemini-3.6-flash
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Hi,
> 
> I've now applied this patch 1 into the review-ilpo-next branch. I 
> converted the newly added mutex_lock/unlock() pair in hotkey_poll_setup() 
> while at it but it would have been nice if you'd have made them a series 
> instead and done that for me as there was unclear dependency between the 
> input_device_enabled() change and this one because of the newly added 
> mutex_lock/unlock() pair. Hopefully the next time. :-)
> 
> Patch 2 seems contested and changes behavior without telling upfront. And 
> a return value change shouldn't be hidden into otherwise mechanical 
> conversion patch like that anyway. The change is generally good otherwise
> so please resend it once the return value thing is addressed.

Sorry about this, that was my oversight and not an intentional change. I
reverted to reporting '0' even if something fails inside of
brightness_get().

> 
> Sashiko complains about the strscpy() placement in patch 3 and that looks 
> valid concern to me.

Fixed up as well. I just sent out updated series.

Thanks.

-- 
Dmitry

Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B39762809
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419725; cv=pass; b=cfAJpWaGxrfumJBnL1boZ9oqyLr/Bj3iCyftbLkqy3hRjACobv8bcqLLUvJLTLu/IUSPwV/xsY49pY8in15r7SJV+VVch3R99Mpsps9nL7gW/B0cljboFwBnfpxJHvCouM/CeEImSaK+07yGX56JCzr8w/LNGQHWiGSDjezAzJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419725; c=relaxed/simple;
	bh=BDxUrAidUvmdE4UU9/YWqxyp9t94nH6PJ+zSqrwq3lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZ0SwOA/gVe3YWztVUYZjBIFH+iIbO384Akc6wrn0ipuNQ2YkPm6iUfRHURlbHYzEPYNw1bKHe5Exx3UcmxD0SfthtyuOFtoM8KfEWdBBaCIipSvFpg5syi6OfRDCLU7xkrMLnwIxsVP/ddEn18sR7Q+4EsAJhfeBnJrDvs0hyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=pzybxd40; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="pzybxd40"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52eaeddc837so16415311cf.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Sep 2026 00:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788419718; cv=none;
        d=google.com; s=arc-20260327;
        b=iLfqrWNLh5dsReb5Jt6iwYY/g8us7wm8fa4Jy37l58CVS1nJcAZ0x5mAaCGJow1CxF
         /BjFhhH/y8xzHWy96hNoHh9UrGqF9f/jZxyTJTQXPVb/QuhKf/VN0E1mgbLgXcJhyli+
         iizAqTJyZhm+NdCq5JJOxbqUnYZNjZiLjbcaU6GAmmhJTbEOZYKyRcMKkDGpzMnxhbZl
         OdXXbdT29eaf1TczUSVwJztkaaMfuElnO8OMiEDsOJuNW4O+PvKV+ztR5e55ibOJhC3/
         b4N8nA5ph100ssNDTWiPod2rDxBZJjAwhdWml8PazyGVpZDeXcJY0WNHYf64pPFDcK2w
         5v3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/3ZaVDaa28jmLpu92uijSHs8QLly3pVgpirsXkJfs5Q=;
        fh=waKH5Ux/XR1iP6cPDYiiuQzd9AbUVIkjKYbvj4c2G1M=;
        b=mRHSWtronCPLTnvZOLoNDb1Q0JcjbiNBdSsdU0mZ+7LJs60l7sA2NaPv0A1tj5LAY/
         GTd0xQKARbaKDT0vRgz4UBk4p2zy9I7aXYfIeXSmV0qyma6h7KQ4xCrCZxZqDqooCMQV
         Do3qf2H0526XoheC0njjD11x0XPSirsHfoqTCVHUf3ZhQZTN9HXGmJa5absbmw0YsOUJ
         GGVk8iHTpFFB7pj4TGNjgIGsEU/VlolQ7gBL8FxiVu2f47CSxTzM/2djireyx+v8uf84
         h8KHZpvDrufrGXUQOAmrICwPshox3rnZpvrhwET7D7br48xJtTJjauP+eCTL/308rjAi
         Gruw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788419718; x=1789024518; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3ZaVDaa28jmLpu92uijSHs8QLly3pVgpirsXkJfs5Q=;
        b=pzybxd4057yCPXBfPDmQhjG7IRqXIMYi5LwPQaiYWrhpjRYbnC71NSqHTW0yLk6N2U
         LeHXabKfKRXA0CEQb3JuWOAjp69N48QhVCXkkT+vykwFjgD3F4ox4ami1hatx8UkxJZw
         gQOtiSo68ejMMfKhqyEDKC9YxEeXMFGtleuswKZ+pdRqUC0GtyvxPjqMeixIHfh4hmgV
         kwDZ2+RUgjgXE/BCSMl+guzCYHe5ANExTik3oSyseo1WhizIPmyLZl94oAODsRM+jQug
         Wp60Z+/PmQnbtaaTJE8iyy4DkoBOzZ6giL5q3oVKI12h/r0cZ6qPxXHrbydggsMeCFxk
         tl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419718; x=1789024518;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3ZaVDaa28jmLpu92uijSHs8QLly3pVgpirsXkJfs5Q=;
        b=oR0pP2hrLm9J0/mMzJ8MitclzO0u01KEu4TvrEpSZ6c1NFqSrU48B9GNd/RauxHC4M
         7zilxYo6KioZCjMWJf9NGKZ7yxB24vEZ/5cTSRqaj7m7ACPhXBBhYfEzIgqVTnI6NCUI
         eBFkMa+RI1ekpnYEmYX+cSZr6cOunOyuT8dPk0JvpNHvYAUAKdh6/aRcUgHlMeTWiKjZ
         pxXFBE2in1T2trCSuiQ/q/LAUzh5tr2BDvS0kRyg4SUxQquNj9e8gvzJsrquEU2x3KB4
         Zuo/dlKRdW1/mxdPcnR9m6rhL62nxSI/RFHDL4TuFG4olMM3uP50PwAXflaOppGA9tg7
         7mnA==
X-Forwarded-Encrypted: i=1; AKwUvByCAnoGc8piyoP649vlSKYhTX/8FaiqWkQfMTSo/sKf4lo4jQYJpjcHT1MA4GW5RrKbTNb5XRYSkQeUSMh2/oLy2hO1@vger.kernel.org
X-Gm-Message-State: AFuF++mKsHjPMZ5fM9yXbpr0QqApGIsGAkvsFDg+Eoko7QAJiRD0NAOU
	+TMzYKhIiiXuFe6xP8lIgiLXj8Mu/HuSHUMewndQshw+EM80a5TNFaSY+QhSjOUc6qmGZZtIt7F
	w9ypNvQxVzNlZvtnu3NYIPmjrNvQGYIptkROfgmD6jw==
X-Gm-Gg: AYBFou0uyPCs8jocc2yrjXEtPGYoGYJrSzxqvYDwEUaiTFtD/Er6XiEFTzDzyDZC0Q9
	S90trxUUwQqVZMD+NcssWVqiMRxdGPCQVb8dg9XkARKSf581s81irV0Kfytgfl/ODORoN0xKCp6
	Cu2ao4nZN/PcFKp+KBt7GW6j4RKXjwl1BpBwZx6XU4CvJf0ASuxnCwhcLwvvOeMrceGZ4PRIYLR
	AVT1DxV7QG0JXQZzD5IdLuGE90EYmT3b9HnNfYcG+4RKrz33MhJ8+HUEsvP1MjhPOXNcdo7X2ql
	WyZlbAXtzSvNKIAM95KRZtDmM6EEuKz2sHfPqq8UEZGoa99LE3yjjbRwj6U5yS7gYJkWWMU7VDa
	MbsU=
X-Received: by 2002:a05:622a:138f:b0:530:1e1a:fc70 with SMTP id
 d75a77b69052e-53036bc87b3mr104794101cf.1.1788419718250; Thu, 03 Sep 2026
 00:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-acpi-char-v1-0-742c450254dd@thegoodpenguin.co.uk>
 <20260807-acpi-char-v1-1-742c450254dd@thegoodpenguin.co.uk> <60e25773-b3c6-4aae-a687-92e1ab3b141e@app.fastmail.com>
In-Reply-To: <60e25773-b3c6-4aae-a687-92e1ab3b141e@app.fastmail.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 3 Sep 2026 08:15:07 +0100
X-Gm-Features: AcwNN1WIqW6SG0lDemdV894_p4DFDolE7YAmpidzaCNJPpqblz3q1bAvW3wQFoY
Message-ID: <CAA6zWZJRpUzbz20daytHO4ygqKosM=YU8UyBcWnm2sUmaEHbnw@mail.gmail.com>
Subject: Re: [PATCH 1/4] char: use named initializers for acpi_device_id
To: Arnd Bergmann <arnd@arndb.de>
Cc: Clemens Ladisch <clemens@ladisch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mattia Dongili <malattia@linux.it>, Weili Qian <qianweili@huawei.com>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Corey Minyard <corey@minyard.net>, Peter Huewe <peterhuewe@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I don't think this is the right approach: I see around 1500 instances
> of acpi_device_id data with plain initializers and only about 50
> with named ones.  Converting all of them seems like a lot of
> extra work, and I'm fairly sure you can just change the
> driver_data to an anonymous union without this.

Sorry for the late reply, I was away.

You can change it to an anonymous union and the kernel modules can
build and then you can go over the code and set the designator only
for all of the entries that will make use of the driver_data_ptr field
(which is the union's second named member). However, you will still
get -Wmissing-braces in your build log for all other initializer
entries that still rely on positioning and resolve to the first union
member by default (the kernel_ulong_t). Adding an exception for this
warning seems like a bad practice. On x86_64 all warnings are promoted
to an actual hard build error via the defconfig. The other option is
to use more brackets instead of designated initializers for the items
that resolve to the kernel_ulong_t but that would arguably make the
code worse, inconsistent, less readable and require the same amount of
churn. Therefore, converting the tables first and using designated
initializers everywhere to begin with, before adding the union - as
proposed here - is the most sane and clean way forward, at least in my
opinion. Perhaps I should add this extra explanation and information
to the cover letters. Unless you meant something else.

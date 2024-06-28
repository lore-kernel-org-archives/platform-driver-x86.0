Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6D57346A
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 21:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719608798; cv=none; b=BaF/sWjUGdbFwNgBb3WSB9TjocYqSgr09B7LUkYHkFweBDHyT0s9gSYRcILaUWMowUIwauqGXsoEcKWsfA1Mc1ZFA7WfFoXJXYuDQnaW9k8Cg1DxMW0khd/uJSIzEDrVb80eH3kOFX+opjNdexkjkprkQabwlZOJo3OLf0A82DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719608798; c=relaxed/simple;
	bh=wsEV9r4+50zR1xJSjJH16X4grNy622qzm1FsrPlUgXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Buril6SihTCmRkWNEDFosXHk3gx0T9Vl5R/vZYggV/Rj/Dlc23rPeTa+idu2TsbfqaPaINEOyeDfVmaaf8dgri42laBiJo0Ozbl4Ubu3B8CtfQoKt36N5hcXUbrY9jLx0tDRPh97Q2rzN5d1cEt5G3iAfcMYWWbkLom67j5rk3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isEKmJcG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isEKmJcG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-363826fbcdeso719063f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 14:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719608795; x=1720213595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wsEV9r4+50zR1xJSjJH16X4grNy622qzm1FsrPlUgXM=;
        b=isEKmJcGVEYDHRVeKwzXSLFySaqWPHf0FWaEVpauhzohP7bvBWvXDNiqfVSpvPqlw4
         57a/jFd0tCA9wdcNr7rdT9gzVJ13swksmF6yR64e18BbNYLCnsvh194Hk10T33BlC1ft
         x8TVR0Yr9AGFJ8WkTlZtN5fvMIVMhOALKJVCpCgl452TMp+wn3oQDw1OFwr26s9T8t6A
         1St3iDnRk+AcJgckKbsB5x3yhZWPxBqrzZqh6oZWM3e3gaX7YLAqV4vqIaLZRjEiWvUm
         5Ps1CQQN8xxwRWyp4ZsbPsIDSADTxyQSQGx1ax+ZeTcGsB40/kms5+1QB3i6lOy661EB
         +PEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608795; x=1720213595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsEV9r4+50zR1xJSjJH16X4grNy622qzm1FsrPlUgXM=;
        b=FIrXd5xLZacnfPDgHe3Zi1uHLszTgk2IBHu+UtykqIhnvwByVfyYXrPcaK93Db7VZN
         ASwERKbKwGfSbp7eYJd6vJir8CJX7e4eiKL0rX4PedKOrQ4Lp3KETa7ie4d0AAHnvZqP
         M89SKhL9aMpSdCJuDWCC9WEgjHAIBGAk7+QJqZIp74V/MeVwPrvvw3nzefKHRJ2W+jcG
         ajnfNwFFOkm50R+P5p/L97d/+jDjf+zZAeleBzvnHa5qUVMcb/sRjJGBABq0yggz1klu
         MJnFev8mdZYwMcF50DWPPhVW8Bj78kr+6C1fTpW1VNgIFLEzk54YSWEGUhspNHocz3ym
         7t4w==
X-Gm-Message-State: AOJu0YwaavXOi43uOHu34ShgMpzTMG/sC0J8FCvuKbkR2WeVk4OP28VB
	GJonXdjT83GFePfhTOjgpYZcrL9y+kP5YTx+beGN6Cm0eiTZH8sx
X-Google-Smtp-Source: AGHT+IH1o+DXzsfegaHWQXQySPvzwC7dOIpfKfylnHYXsqj5g/gDMmHop71TZn1yWm2fOozf7XvZPg==
X-Received: by 2002:a5d:4112:0:b0:362:41a4:974a with SMTP id ffacd0b85a97d-366e7a52149mr10920660f8f.66.1719608794904;
        Fri, 28 Jun 2024 14:06:34 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d9148sm3297483f8f.34.2024.06.28.14.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:06:34 -0700 (PDT)
Date: Fri, 28 Jun 2024 23:06:33 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCHv5] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
Message-ID: <Zn8l2UmSDbiCilGL@alexis-pc>
References: <Zn8jIvxVFPtuw0r4@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zn8jIvxVFPtuw0r4@alexis-pc>

Hi again, just realized that I forgot to strip out one or two
unnecessary modifications -- will send a V6 ASAP.

Sorry for the inconvenience, and have a great evening!

Alexis

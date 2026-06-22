Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8427A476;
	Mon, 22 Jun 2026 21:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782163172; cv=none; b=CXCttdDwwGa5Ph8gI0gII54tafkEN+kWgbEL02ABBTxXSrZk6oZO7rpmXztqzVJTXFMjbJlgCpDcaA38rd+L3KFf6a7qsyNxt4+9p2H7phGb23V6b2Tov1LW5PDgct87ZsUAZVx/sp28/nT2/DumV+bE5lb9pAFIwbnn619HT9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782163172; c=relaxed/simple;
	bh=ISC4020ZIz4gMiQQoMhr3KtdDxgh7FplcGPGiyOrbdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7Z9EsaXm+WIfsUo8nx0Jt5UAvHv4gH8ebVm3FlugmBKIvMIL5GvIOQQIgQqc/0TDiXes4WNM8BDZ0sVj3rh7jGT8RbetnQBHws1izG7BFsuSs116xNNQqPRb74+Kcs99IlnqOWzP/GawlL8ztNLV34lc5BsnbrIF4jF89UxYtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ItwPAEWn; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ItwPAEWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782163169; x=1782767969; i=w_armin@gmx.de;
	bh=ISC4020ZIz4gMiQQoMhr3KtdDxgh7FplcGPGiyOrbdU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ItwPAEWn6SNg/GcUHxP7Ga01CjW3Eat9h2wLuBEIfdVD2Ximrm0fU6/Dudn7WVqt
	 YMaIxBtIH9U1q19r1NqLB+aeN5S3TUh03ZNeF0oSBnRbCrOJc1XQQNEda2iKpKgRS
	 E9X7n/6eDZArq7/Iu6cNlPlr8qoDoLrfZlizTmN24s4elnay7kntrkMPqOQS9aHZ5
	 5+yt2goPmMpp2DLvQqT16mdCHcBd4ofzGkxh32l6vtIEHIoctjRJ1UIp+Y52bXMTQ
	 lgd4Pu5LuodL4WjUcJVZboWsMm/LWKJFRSwPgC8MaQkAObmZp9xDu5oM2TKc5/TAX
	 nkcG/fKBKpO5+O17JQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxlzI-1xNZSJ0kfu-00vmGW; Mon, 22
 Jun 2026 23:19:29 +0200
Message-ID: <412e1b09-a442-4156-bf21-216ad8177096@gmx.de>
Date: Mon, 22 Jun 2026 23:19:28 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re [PATCH v3] wmi/core: fix use-after-free in wmi_add_device()
To: yahia <yahia.a.abdrabou@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <12f6446b-2f5a-4c9a-8f89-93b8db94b818@gmx.de>
 <20260622205743.46192-1-yahia.a.abdrabou@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260622205743.46192-1-yahia.a.abdrabou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ccnl/id2/A5MeJ2fumNFo1HV2b9zadlpJq0xkDmOJcy6mcc7zlZ
 PZX63MV5wIgx+1UU8OFcR1bkIa4nwAIq2msX3w1NL2jIDBgFhQZ8+2qOtBNJmYz6H5eLykX
 QlvBhsXkdCGruuhZK0x8RjvnS1MZmHitSeDXv5x7zFDVpxgsZzQTwda8I6h4gNWEWkPZEPa
 DPBvBYEnsYaFXfQyHTjfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1e+utP5sgWU=;+LPhlGTUhpcHASH2VXMUUYJugun
 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
 D9xGIufln1t99+Yb96mm2u91WAo=

Am 22.06.26 um 22:57 schrieb yahia:

> Hi Armin,
>
> Thank you for your clarification, I am
> completely on board with the idea of changing
> the flags though I dont get whether you mean
> change DL_FLAG_AUTOREMOVE_SUPPLIER in favor
> of DL_FLAG_AUTOREMOVE_CONSUMER or do you have
> a different idea in mind?
>
> Best regards,
> yahia

DL_FLAG_AUTOREMOVE_CONSUMER should not be used because the device link needs to
remain even after a child WMI device unbinds his driver.

I thought about simply dropping DL_FLAG_AUTOREMOVE_SUPPLIER, but i would be very
happy if you could test that this actually works.

Thanks,
Armin Wolf


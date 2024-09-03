Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7AE18E77D
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725392537; cv=none; b=WTcyCKrg3bDrxxTIggXFX/IGcmqm2zPKgy/dmpcenk+qEI7SPQ0+JwHQtxCL3xKDKN3cLviPSxqRzf2OnI3y75h2tHOkUnFwYDKsPsJF78XsA4Rxl3TeYfUE/qps3EI541UTqi5jgQhHrmNHHyzaI7pj5PpqBgdiVUYfNmK0by8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725392537; c=relaxed/simple;
	bh=TfSsa7xIMth7yd78HszB0pZ3u7/qV4x7Nm8FrIu/jbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bY1VdncX4tjqterb6+1TMCO/pHR2kM0qcBZL53ej6hqjwaYhzdqxvAOj9hb1ppqCXam/oQtxbJWRJfwlb0dMNa2f8H4zC3JkGhll35scr0UAZ9NaxWWFofm2Mh9xGuR/OClT4ornCBajlPXv5+M6Z9Z83mRUn53cC5m3qaM4yqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=X1gEBNwd; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="X1gEBNwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1725392532; x=1725997332; i=w_armin@gmx.de;
	bh=TfSsa7xIMth7yd78HszB0pZ3u7/qV4x7Nm8FrIu/jbs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=X1gEBNwd1SQwfdL+neT6ogY7eRTUntL+Dm7jC0Gzpsr4YdoKUoNVHVdta00bfdof
	 NkStuJVpHUOk8hisnKQnG2kKcmQFvcyQRVcG4kipV+mnwyk+has8BwQfZx4hyqKv6
	 BnC8d4kb40Nw7SYsuRZL/p8rHSebG/XFD6G3PwDYoZDvI/4b9ilNjUJDJTdQkzzbC
	 70pjMKBTpccr6h6+0jKhWyULpn4CDFvFZ20D9X6u9MLntYjAep4NCtZwhtf+bZ41z
	 ua+sYsGy72VaxLCKqTPsiWJFz0fMUt7/vadOn0C8c7jyEWFC3HfjbUfjmmDSvoCBt
	 youUUBQUoJmHYh/S5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma20k-1sXBIW02pI-00Jqv7; Tue, 03
 Sep 2024 21:42:12 +0200
Message-ID: <d8563b6b-8ab8-481d-aeba-656c38dda2ed@gmx.de>
Date: Tue, 3 Sep 2024 21:42:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Add Support for the Acer Predator Triton PT14-51
To: Rayan Margham <rayanmargham4@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <3c63701c-f9fc-4f98-b991-58135da3fcc3@gmx.de>
 <62891F43-E938-4DF3-9E51-9CCE19784DA8@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <62891F43-E938-4DF3-9E51-9CCE19784DA8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:prM+PM08Si5GxV0lECzLyis+3Y6Ycxl355+RKXvvk9nlim3+QPx
 DQSZU5rzPe6fh5d+2EIqU7kQilrBnCum6fU6LLjeuh+fQdRA2Nvf67v7+Q9BRp93yIqL+YY
 N4B+TWKsTSeDgNR8V4nBEEn6MOa/zzZJoKVVtEm2jCeu4Gx9BZP+LMyHZ0oHu7nbM9tWM5A
 X+SavbmwZDNfNDxuyFB1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:en8HnZxC57Y=;Jt4E+zjgXi1tJ1RM1AZWukmbFRQ
 UiLhzByW68ufIXlFjLGRvvLUM2L+HrKpWlKtkLRpyRA+hEsn+kQ2Pml1KMNcGF+lCzRwMnlNp
 vu9yAXqbuRABckILCrZ14q1d/kIp34rB6CutbsAMmCjCSa5aABeGMDR0UbQ6nRTjylnNYvCap
 GOR7WWNLiplTaxm5zcr1kFypWMR99rC/BUgOA77Gm8J/txDG6r8MGPlpWvB+JaUHHNZAP5str
 KwCWVNbbMR/NEjcxjHznQ2Fs3uKLzS5ZOkxmA0KGXaP6V7eV/BBh79uDUZ4WP9kazxP0tfdAV
 L/insm7AB6QmeJUMXQY1hrUmtfkSGGP5fbUe5lvNbOut976XZJbcEtlg5UPwT2fJWda1foiNI
 Q3j3nJ6OKo1VAtyDOCKTrzP7LYVYQ6DBzoMv6uhwAH663jEcBhHTOYjaR8upzNeoBACsTyse7
 o08FuejA7jEan816OxtGGjBGQX7DxXzvSnXoV+234ciY0h20BgKrJj3EOj2ejALyNG3yqY9Ds
 xAY5X3CPDTKHihcpIgVB6nf1tS9Dqh9rXqv6TRBm1sdsG78mI3llmsnJERy85NHWoGe8/l3n6
 phx6kzGB/XE0fviGw0hXRcUM/BsBAxyoPLU8I79XpY6erWBQumC/Cbd3KhuXTKdHwf00gzkBZ
 WO/up1gTcAYnUsJfKP0Belb3pZ6hPUbpxJfSc/eu/rTyxfd+y8DGtSKYrqtc1pgiB/rtKms/s
 SL6/ozapb8BJ4nF6bHcDksms5iM58F6xiQE9KMkERCCkMEYZWWTCGIwE5HPp9lJSL9mJar0cC
 11OuUy7nrmU1rzjUYgB7oxVg==

Am 03.09.24 um 21:10 schrieb Rayan Margham:

> Hi Armin Wolf,
>
> Any update on the progress for the driver?
>
> Thanks,
> Rayan Margham
>
I am currently quite busy, so the reverse-engineering is still on my TODO list.

Thanks,
Armin Wolf


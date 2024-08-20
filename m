Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFEE15ADBB
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 18:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724179721; cv=none; b=p4mRkDor69YyF3g7nIh5MYbkYP8SjBETZuT+EE1ogJNIZpjMrzTkq/zDXnR8zct2n4NhZF14jiaqkxBW4ehw+gMGdFg1Iq7aqZH7aTWizaDTfk+iR932TQ1xbPT6zFqBW5CulKdDvj0ltaRsofBUy49Mv3y6oaTEzNg+WBDVpCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724179721; c=relaxed/simple;
	bh=pSxubILBJFQAliSp22EfI8Ms8vp9vJfEEFbvkZw/oqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qujCC6SBdEJC2DK2cYusfA3O9sd+AuRozcTHgCOlIzC7cVZgvnEyFA2zVOF27WcXrl4kHDy2tKO3yA1OVVBLqrTGw/mRVylE9RdGavvTltjQHG27hhwTKRSbMmi39JQcXjEaY0CUgERj30j7va5tBhNHpcZahSYU0m7FTuzEJso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Yk+tOgQ0; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Yk+tOgQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1724179716; x=1724784516; i=w_armin@gmx.de;
	bh=pSxubILBJFQAliSp22EfI8Ms8vp9vJfEEFbvkZw/oqQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Yk+tOgQ0PpmQ1P2WKI0TzyDZ5GFlb3Jcgbgus01ylkCVAiMDLtVJ2VKtl4vUsEXk
	 gI70hHqezNj4Mo0nFNNfClEobehNHuizvHwWpd4xxKxh2UkX6lWw3oZT7pYJwaZnO
	 P5Hf2ZtxuE6U2qEWyApSpS0z+sqhNYcMo1L3DoCoxeL7YarfWH6ZjR7UKMYYWu4v9
	 YKmujMvGSpmM4ysId09GIpmj00IsIZ+1Ow9XBsB0gQ0CjYUWTmD0wikwiZ04Z1RSz
	 /NTa5wUaZl7jmBXQqbR2H22XsSZOyoLLY063vHXO2Yyd1EIRfrMWTdKhRS3pYOl3o
	 q9SrwTTUSdKnKUaWLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Daq-1sn6gV410q-001OgL; Tue, 20
 Aug 2024 20:48:36 +0200
Message-ID: <808c835b-3500-4345-a338-b0f8014d049d@gmx.de>
Date: Tue, 20 Aug 2024 20:48:35 +0200
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
References: <CACzB==6tUsCnr5musVMz-EymjTUCJfNtKzhMFYqMRU_h=kydXA@mail.gmail.com>
 <749421fc-73d9-4657-86f4-40cc048265f4@gmx.de>
 <CACzB==427GUH4b571KuVDzh6EsG7kB4bb00hmLu=7OzEt4QrCw@mail.gmail.com>
 <1867c880-41b4-49e3-a02a-b61438908e98@gmx.de>
 <CACzB==4tJ-NQbS9GjJqNW3c_tEDiggEq_cbag674nyy0h0C-WQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACzB==4tJ-NQbS9GjJqNW3c_tEDiggEq_cbag674nyy0h0C-WQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5tkC+4Vm/hv7jx0eV0l+pps6dLtSBiA2FUmCT3nZwmxr262zaQv
 Zl972V9KG9YUCOTgt80ia1TEtm9eY3izbZ9+aNM0NY+q6yA3W4gT2eGRyrLbscUCRdbn7N+
 mW65VVxPPvXLouAAPvBlbg//gduVs1hhBSwNZxww/M5KVxqY1QWG6aVQrlGk7nDOBal6aaB
 YLGFlyM30x99PC8WX1asA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uKuNYHWb5gM=;lTI5BZ30vr0KBfWdRoDfHtuInrV
 bCMckDXwJwizw2egpeJnd03zeRrYujSX/waBBw/dvRP5fSuOOkoXiKxoRtXnEvXXv5umZTqZB
 Ww4/NdKXvp3S1hP47G6DxG97dddJ3xA/WZqkAz4epKgk0InOLZpky2bmKQxJQkEF5BJHD4KOB
 gU3F2yNjKe2w1658y97ZHFUUo6wOa8LxuXdYf0hNQKvPh7HewmkmwTGX+ft7o8v7JowC2wUzE
 DYAXfmsOT7JfkfrqulzB4cZs1OgVHs2KkKp40ixC9APfv/QYqPU1KnMaMxRthNLjPGVboriyZ
 wJM7Nfvbutih93F7YLAVhsW/KSJ482upqJGc1XZ9KHp0TOnjMIOslecdulUEJCLT5ViY0SUGJ
 YDqD7YWLOfM6LQ/WxNgqB/El4yVopnElcB4xV0xNe86b7v4I1GHioVzNt5v7umL/RQ9aHMfzx
 p2qyCnM2fHUQeVi0rF/keRGCvOWZGjCaZGI8TGFNs9WM1ESjeYqCsWAujcYYnryMwLsZKAnRy
 mKbp1ukZQ/fpRjot5YnC+pbytBSO5w6lCmhk5TR/effY8DZ78OO4TMqCZ3TjLa5adE7rJmj6i
 QhE4owjjsz+yBhmfGDkMcC8y5MDf6Uv9X79SDH8f/3zKuPAdKX+jyRAY/BaNeH/DH7zdj1bn/
 jv7kB79nVDtTfR8n3nsh8WTmkRpTpAah5nn2EsDpXnh5LtIIMo6qTLRV7Vdo6EzFfN39ff/UT
 s+XJxcgIbLXMx6tXs/Ai2tFfKhrpmvde42pR3cqsZ/HqmGt+VjcWZmLE7tMqvxP5ZWdKX/5Dj
 SaMiActqm/4qZfmP1Yed6fbg==

Am 15.08.24 um 18:28 schrieb Rayan Margham:

> On Thu, Aug 15, 2024 at 1:31=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> I will try to create a prototype driver so we can take a better look at=
 the fan-related WMI methods.
>>
>> Thanks,
>> Armin Wolf
> Okay! let me know when you need me to test this driver, happy to do so!
>
> Thank you,
> Rayan Margham
>
Hi,

while trying to implement a prototype driver, i found out that the acer-wm=
i driver might already contain
the necessary bits xd.

Can you try to load the acer-wmi driver with the "predator_v4" module para=
meter set to "1" and check if:

- fan speed reading works
- platform profile works

Thanks,
Armin Wolf


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626332;
	b=AdIfIsXHHLzjROAEC/EPPSfgUzOj4TZC8qJVz1yZjlmU3WkEPFdxe5gKNFHH4mtFYo9G
	 qlGZErJyCw31PsxMgFOhx+v/fnHfnmx+wqRqH7fpJaCc/qA1X9Gr1/2YWI2U7sjBHRnkU
	 ac9313k22Jw0jd9QKics0/vabJ3Bu3jLE8yccCFEhnM5KIpQXifYrYLHz60ZzQJgzKl6r
	 3kG1/9/p1f+EmqkkCU9QEs7jBBcLrjr91+1T1LZ9Mxyg9Ofh/r2CbTBLJt6/rwjul4vsN
	 VYX5Hp9BOZ3M7v+kcWdnqmbkB7PaY1VvHlnbMVgMQW0EiRDN5z41K08TVgV41LXHvGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626332;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=vYg7t8XZKNyEMUQyJABYzZaiqQSY5nMkUX9IFZmor98=;
	b=DmV6bOMCUuMx4D3v3DaDLwj4x3coTcep3DaIXyFmnALCXoP1vb/RhCkbZuRPLwAXnIVb
	 EIU03RrEuN+EPe74j9mh5rkOR0s+hrpJ6t1+Ah/AoW4eXuDbFDt65oG0e4D9HW1VFzE2Z
	 HosrEqY8AjedxbPvdoUFmM0K+ZLlEbXdI80UEr3cCbCQaFvhV+YHjH1Ob7igO9co12tXB
	 +d8T9D9+mg7U32ctAXaNytjUnrjfyK36LcnfG3NM/JOIEFFeTaLJ2quSLkUw4c02AK4gI
	 mUFpyVaJJL9PRATpImXhbeb+jqRtC52Sy5Xt1nKtfNVhxY1DK7otpXZmzBHqFT2ZMug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=IVyJQrsC;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B1hYWHCS;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB6E606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 17:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB6E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=IVyJQrsC;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B1hYWHCS
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id 688DDEC0C0D
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 12:05:26 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 25 Nov 2026 12:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795626324;
	 x=1795712724; bh=vYg7t8XZKNyEMUQyJABYzZaiqQSY5nMkUX9IFZmor98=; b=
	IVyJQrsC9F/cjwCbtBulgCYs7L41lVu8WGDaZVbFaqKmbE4efT0iC3NVuO8Hcn2z
	N9lbOvlOsVx2eH8Qqwwodb/DV3V7UiTuueKKZUTcaI9fO6sQNyL05k255WJtoiST
	lEiiqgST7hBbHKuYzPwxMYeUjAx6pMTx7yOoN6sYJPul8ZUYGoYe+SrBbZLM9Suk
	mVTHpmIA40XS4eJNjfikXWQ01Fh1U4Kp7RozLrEEQUzdYzQnhcGjJhtS0G3zAQ20
	SuXzVvhUl8uj8z1en2vGwAvqYqV76n2oqRx9cQ/HTWCVvoVAyRhPNNLyKhKu3VoV
	AOUs1eaOFXf65LJ9JsHiYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795626324; x=
	1795712724; bh=vYg7t8XZKNyEMUQyJABYzZaiqQSY5nMkUX9IFZmor98=; b=B
	1hYWHCStz4kLnQ3C7rwmsa1M8MdsAQkcpa7aSPbhyXY9IgVBReFezYIfYZypqwGQ
	o0DTw0NC4Bx4vvWg6tHSIYqu2Wzxh4oSufjq/+B1yqVnwe5RtX2ONphXEtznq9im
	gR4wnP0apiOdZsjl9dfZpRzFzvSGDhb8MXhze1LAFgleCtPz5mIP1pwgAQM51Wcw
	EF3XmfCh/0GJ08Hy0SXbpYjL/wKcMAcpdbgC777vIt4gAc9wMKcTCtDcFpchdFNF
	p4VGGN6tmnGNSjM3sg/QmMbDP5lZoz0a84XOXDfSZiYMe+inc7AvJtROIRxArBzX
	l53DEXhKRqWvuvykHGwGA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795626324; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:QwVxXfKvwg7eDR1tc7/QiZtXQ75CwysOZbk263OB7eOrkqL
	je1qnYmlRsgouZ6cV2oFRoQkpy4dBDHhDVPmSTmn9NIlEE9Uz76rP0fTH6JjgMJA
	UTew6zygbDIU29ChFWBf85Zjhd4/OGaw7ZdeCDA2ShI3a+nI3nMHRTrAhIwl4naV
	PB/iRRVAzfSQjqPAZwLsBSmEeyxVHuQvRMxytfprL3iEeXVrqNXRDRA4qQtAn8PP
	IUvC0QrWSkq0tlCdTc9LDoAaR0LCMDbElmRXbzTgsevVtLPQ1Qqo3XCPSoPZEexA
	+NDAe1pAnNbyJwTt4t/OUGE3lYwKD1CbD38ZMGw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vf0C0P39GDISTxoRyvbJ5KXwF/Dr1TLEJqkWUNhREpw=:tg15kuPTnEV/RD4OLr2bGgyTaArD+70sWO/1H+nyKvU=;
X-ME-Sender: <xms:UxUHa8yIbZC86I_9a6Dfs8iJJZyXp9jyqoVpPpvZCsE6VHoPXTjtNg>
    <xme:UxUHa7FaKcdH8huw0e9CPy2SuT0eS3vAq-8NbjVaHk_UZ34bXPklE2mho5JTyQ3ut
    9YVaSrYsI5Tfgx51YvrSHTx_LGPTpjvYQWdf3s-ZekGKDpnyaiSs_U>
X-ME-Proxy-Cause: dmFkZTEvR+FRy8c0wMCrQQh8GBLA4oaTOB5xTnLxGAErxA2jnLKOxR+uOtsOIjm/nifizJ
    hw6y4pkrCuja5R2fbGn+X1kFXFNTGWPVoIpmiHcteplnWVSUQ8GPOCk+62YzCALjphtxCq
    osWFcHYC4uFdPbsv1KfablBeAQ5K/7Zx9aeOMNzVI2k8vxQsdPN1TqS708GPn78Bq+lFt6
    AOugrqSHB9cbzEUHcl4ErxuAF4A9F0IDeToURjCyhSN5+DHbaSHhbsHFtDTprFK6VxMAvw
    wL7/zRrduTH2f3btmKhAe4Hv2fYloLpUjdmyJ5ud0xV+bjEdjll6HToxv2kDEXKIuq3WDc
    KxXcgsCvPgBqiji/A3Ub0sgWYRJKw49tNRwUopDnF1EAtWYJJfVF2rj6/YKV3xXkx4pN0x
    gvLIycftTkNbn0eb+5GTdM2UOjNBvj6ox9SkWC2gRpasmUk96/jZ7R3XjJ/7UVwxb4w663
    q6YYAg7/Lpa9fp+TBxE87tmoX1m1BmS2716QZODGWnGTlwWoa3sNsfUuLhhOV9RuFRPatW
    pdCCuRcMEvv8YZeFr7Zwn+UF7Th+h8ebB0KErWS4/3/Vkyc3pUEISTHot8+Fazlkw719bq
    hnX0F5u8UnejsJG99qiOkUfV+VCrA9kcB/VatFDRN75KUbxyBrHAuEXUoCFA
X-ME-Proxy: <xmx:UxUHa4RYV4cqKc9rnizJUr7-HPYq481bA57qZU3EnEz5sbr8H-9TEg>
    <xmx:UxUHa41J3FsaYFwRP99imQwKHblCl-KiIADgSLXq_961GolaW0ubLA>
    <xmx:UxUHawfX-Xa06NcnhUrPH017KR745GeRUZFV7GZpxJufl3tcx4zReQ>
    <xmx:UxUHa4NPB0VcwjdCeMebiSvSxzETcEVvfZJe7csKRrkQ3lullM8LHA>
    <xmx:VBUHa3czGJQuQSd3AmAz0x9hgMsnqLKxT-bqCmR-nnKYE-uQIUR4tFMT>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 263902C00085; Wed, 25 Nov 2026 12:05:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AfY4cavotJas
Date: Wed, 25 Nov 2026 12:05:02 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Tom Hu" <huxiaoying@kylinos.cn>, linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Rong Zhang" <i@rong.moe>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 xiaoying_hu@126.com
Message-Id: <49ade1c5-073e-40c5-b163-6866d051bfca@app.fastmail.com>
In-Reply-To: <20261125125252.38003-1-huxiaoying@kylinos.cn>
References: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
 <20261125125252.38003-1-huxiaoying@kylinos.cn>
Subject: Re: [PATCH 2/2] platform/x86: thinkpad_acpi: Only check charge_start against a
 known charge_stop
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, Nov 25, 2026, at 7:52 AM, Tom Hu wrote:
> Hi Rong, Mark,
>
> Thanks for the reviews.
>
> On 2026-11-24, Rong Zhang wrote:
>> A random thought: perhaps initializing charge_stop with 100 could make
>> the code cleaner?
> Good idea, Since charge_start is already limited to [0, 99] earlier in 
> the 
> store path, defaulting charge_stop to 100 when GET_STOP is not 
> available makes 
> the existing `value > charge_stop` check a no-op for such machines, and 
> the extra 
> stop_support condition is not needed. 
>
> The v2 I'm about to send.
>
>
> On 2026-11-24, Mark Pearson wrote:
>> Have you seen this happen on any actual HW?
> Not on hardware I have access to;  I agree a  firmware exposing 
> GET_START but not GET_STOP 
> is unusual, so the patch is mostly hardening, but the current behaviour 
> (rejecting every charge_start > 0) 
> is wrong either way, so I think it is worth fixing.
>
Yep - just wanted to check. I'd go and ask the FW to be fixed if it was being seen on real HW ;)

Mark

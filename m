Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794272820;
	b=bgNki9OYJtff2Zrn08k/wOXjGilJoqPkZslbEnF7+mNJTpyOzvxqwD8iBBNqYGwI4OkY
	 6UvpRtAEnSn+ogKCfaGOsSWo1mfjQDT7C4JZjDDOU+gaXUvKDRq6oAZJlw8JjHH1gWCQB
	 b5vpyl1S4tdVxnSer6NCdIAfCH8XORNKHaTjpkOYOWryBANUyw5hhC2yuJera2r3XRLb+
	 pu4nfbMwI6hjvVIFJg43HzwHj8g04F1Vn1TIH8onh9IRxJv8XhwXHaxfWKWkt6uw/C7YR
	 qN+yiv6n8Y23O2qv7NVL1v/x6AlXH006+M1tMt5wUA5CbL5PRAYDMQ3+V2X7EBYge2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272820;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=YPYW5J/jQVp8/KcH9ay/6N2DrSqixuZWGsZQEI4iHbo=;
	b=XU1miVOElcA4t+gcZwQOsJkJUjPvBmOoW06M3SZWsEjaJSNIEpGGmD2I69XOWBss3alI
	 EQ+84I3b70gvCae/etzxJlxfH3AZxseGI5BD7MdfRtWbHuURmQ/y3PV5WXXSKpfAGvKXo
	 NwcNN7ieNoBmJTXdyyiYKky0IXc+Kmk/AD0SONMvY8o/8+82vSUrdkjpYknVIZlbvqPWn
	 Wmr4qv7Fv0iimsECWl9Mdim4SpVlZwN6YmyodgjHwoAs1+o8Zxl8ys5ENFEKwYlJ4iRPr
	 yrlWDpGBghsUOIQVm5q67O5uqi0b5tFrzXJfRgnHiH6bSUWqYLvnRt/Srpq+uP/LWEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b="B/VfCzn7";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fErgId5b;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671BC606A31C
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 01:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=B/VfCzn7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fErgId5b
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A2C917A01B7
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 20:06:58 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 09 Nov 2026 20:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794272818;
	 x=1794359218; bh=YPYW5J/jQVp8/KcH9ay/6N2DrSqixuZWGsZQEI4iHbo=; b=
	B/VfCzn7o92CoXxLZO+A4nKMyJ1k3Is9Sbp5qd7uJUM9K9A8RhpYgQ3DrJvwoCTv
	ttr1r5m+xosnzXxn+Khjd5EncyLqyAYTxTlA2OJ3CZECTFi9+KbupWQBlBIxQDd9
	gRs4i1Y0ZJsB8NdiWYYkKkDK+/1jNutaFaeKYQHM1O6StXqUxRCflHRIhtDGyVsi
	mzOH/5MHLlQmgpn/aX/hVRVGqsbgpVPSXydMqaL/uxItIskbZdpenvbEItsMhxvW
	VLgnN2ch2Jsn5Imxc82GiQ7/+7zvjCq2Yv3x1u5EbZPpLK0Nai4kMDCvCBIxmLpI
	XrysCA3kgWCff6T3Y0dk7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794272818; x=
	1794359218; bh=YPYW5J/jQVp8/KcH9ay/6N2DrSqixuZWGsZQEI4iHbo=; b=f
	ErgId5bFvKiJ8picMNC69wLqfcukhyTei6wJ8v8doQgwUEXp0ZClOjp+BrOovPzw
	KuRjKkHTq0wSEoqH+REdZ8MqhgQ5FUK/sgY63KiRbbM8zn9Po4pRM8STR+NDSAsh
	hYa9prAbzwGKFNbFUKFsYnECBjcNDrw4HoJns84lqT22RqlwolAtWRjJW+TbnDp2
	Va/PPX51xoR7TF1sUFh2YC2WedAWUpEpnXu4arEQYmfyDn96LYBdbF5sqwE/u3eA
	AP3iJu9PBgRKk9dZsGq3Qfdt1hRP8IT7GKiNm8thXq+OIh5J8yb1g7XzOcyavJhd
	SNKkom4J+9+EttWRfuDLg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794272818; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:KO01wN+Cg3rAh1KY3KAR6Risst5njsf4FkXIlkUWg5sgwmE
	9SabmosA6oZ9MnFP9hGU+3uN5EN+9j3MpingvfPgkiq3Y4eF6aZ6ESs6QlpC+7Ng
	Q2W6NppmNOzIWxmE+0QB2esnX0OPJ6wR2haEVCDsvtM58WMMK8wL/9yl5h3L42v2
	NnbhQkZLXw29XZDb6Tlw8kXfx7Li0Qo3Z/rmtB9pw2NUS5ZpX2qeKrv7jpxf3rqr
	WZZ6XUOz7+vpujV1GcBFVCbR21XBf+hCYI9m9yNJdBgAbSBys5oTQk5F5kEY+tmz
	Z+aCLLANAXzGTBwts8Ug4YojlycEgvL50JB4whg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ihsp2KObF2wwyV1mtPDfeoeaZ2byTKAI5MB0uXn8ncU=:TB8/06C/nXFEhlp4Jq/SRv2KNAh2Bqw4zTmeLb9p7Yc=;
X-ME-Sender: <xms:MW7yaqR3V4O68U5DKJj6Ro06Ac6u4KsNUnfSmRnAkN7TISmIm3B3DA>
    <xme:MW7yaqkceuAjDQoyOlhGpWFKNVSvbgho8u_kiJU-atXdeKti1J9iAyEcsu0BRiRto
    JosJn0aMgQwPaurQHFYjUIMQ5fcDVROQtUzdGNgiNcZ_rq-DrWRGZmv>
X-ME-Proxy-Cause: dmFkZTGv9vdl60/iBVRnZePH3FHjJbIzTPcHqgskZDTeiHlLcxTCTz+KZ6RtCXjSniAmc5
    XNFWb2k40zc+0oYHW4cvqRsty7dUUMdiGODiHISl1JNfqjZfFzsLXJhIJFq3N4kIzT9cRO
    eeIyFhVJMYxXTjkvsvNz3unK+wwnZ22BZc/yFnxxPTJCvgK2J6yk2NYO2BqSxV437+hiTy
    2QTGtfNv2kSAedEEXRyzh0Du8JARkxJI/LBN2COscYwikZNWEJ7gZaLXzinmgLkToqhBT+
    KoE/tii41GPnxVozn4isPB/upnRvId/AUu0givtk2P1s43eoBQsisvFyqmOXQIvNQ36wZz
    o7b4d9G+ALV+SMibRpdBuAOoSBfErXIbJiOCVA4QChpJ+gSlMPIwL3feFAHASmDB+FZ688
    Ndy98XYWX4rUu1t6z3c815MyMjr01rBu1T8VDnUEodSkTTKfrZ1wE1UjtwfjredGSCLhYH
    rRHVBWi/ZDqIDzpwYnH7TcmBhuqk0YXb7md0COAtFfzFoT+v6hTWTzI3AIX+ZxFBGK8fBX
    cvm8RBPw3ralhFeqPYK5UNwlWRLLYeWdJSR5tMeIqjauBuJwe4sqvGNgTbHMJC6dNFCGLC
    vnCse7NAqZJojd6i9ceoq0n7Oqzr9eQ5tfLveYaLJlUUR6w4Lac+bB8LxBYQ
X-ME-Proxy: <xmx:MW7yau34PCmgGfYng8Lr3NgEQ4Jk5sFfM9BpluacmOUWkP1znwf5cQ>
    <xmx:MW7yajXv5FU1qFCA1a_InZcLgYDGHBrSMCd_UCIGGjSTg4dKwxgROw>
    <xmx:MW7yapJTg6fSeghpR7H6urIkV4EPIghGIoDi4apuAbLTcnuKQ_gV7g>
    <xmx:MW7yal0vR4XDUr4HqtlhObrf2LwbcfnFeKILOEsuU7Saf1rMMZdxWg>
    <xmx:Mm7yagaG4EYWSQzlXBPb-kQLJUbXkRzVATWzcNOZOPmhkcPjtP-Zc_-->
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 8678B2C00085; Mon,  9 Nov 2026 20:06:57 -0500 (EST)
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
X-ThreadId: A3LsSXLBOciw
Date: Mon, 09 Nov 2026 20:06:37 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: qvkap <qvkapp@gmail.com>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Ike Panhc" <ikepanhc@gmail.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <b7428de0-c009-45a3-a2c8-0722ed7bce6e@app.fastmail.com>
In-Reply-To: 
 <CAABLQ8qdSC1r=-et0y6qnEjNE-FCvoT8wxbo6R9vmW5=bUOSgA@mail.gmail.com>
References: 
 <CAABLQ8qdSC1r=-et0y6qnEjNE-FCvoT8wxbo6R9vmW5=bUOSgA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: add no_rfkill quirk for IdeaPad Slim
 3 16IRH10
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Mon, Nov 9, 2026, at 12:02 PM, qvkap wrote:
> Hi Hans, Mark, Ilpo,
>
> On newer IdeaPad models such as the IdeaPad Slim 3 16IRH10 (83K2), the
> EC/ACPI firmware reports erratic rfkill radio states through
> VPCCMD_R_WIFI / VPCCMD_R_RF, causing periodic soft/hard blocks of the
> native Wi-Fi/Bluetooth interfaces (iwlwifi) without any user
> interaction or physical hardware switch.
>
> This patch introduces a no_rfkill quirk and adds IdeaPad Slim 3
> 16IRH10 to skip registering defective ACPI rfkill devices. Tested and
> confirmed working on live hardware.
>
> GitHub: https://github.com/qvkap/ideapad-slim3-rfkill-patch
> Raw Patch: 
> https://raw.githubusercontent.com/qvkap/ideapad-slim3-rfkill-patch/master/0001-platform-x86-ideapad-laptop-add-no_rfkill-quirk-for-.patch
>
> Signed-off-by: qvkap <qvkapp@gmail.com>

I assume posting a link to a patch is not going to be acceptable (I almost didn't bother looking at this one because of that because I'm behind on my overflowing inbox) but I'll let the experienced maintainers comment on that.

I've been looking at a similar issue on Thinkpad's but have been trying to gather data on which platforms are impacted. We're finding the same thing there where the kill is powering down the device and it's never recovering - and we've been fixing FW for the last 3 years to make the APCI method a no-op where it has caused problems. Recently the FW team complained as the ACPI method is used for debug testing...so trying to find a better long term solution.

I'm not a fan of the DMI approach as I don't think it's going to scale well - it means every new platform is (likely) going to need to be added; which is going to get really tedious fast.
I don't think it's really a FW issue and more a fact that device drivers have caught up and the ACPI rfkill is no longer needed - but I'm guessing a bit. For Thinkpad I did get confirmation that it's not used on Windows FWIW.

I have a patch that is almost the opposite - I was going to disable the rfkill mechanism unless a module parameter specifically enabled it. 
My logic is maybe some older models will need it - but so far in my testing newer (5 years or less) seem fine. I've been unable to determine the cut-off so far.

If anybody on the list has opinions let me know. Gathering data on the impact is taking time (sadly in short supply)

Mark


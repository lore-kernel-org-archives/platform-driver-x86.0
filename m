Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271914;
	b=S6FPfkjE+xQUk7ivasS+sdGvkno23gGVmfxw8Za7nwIgn25lBEv4CfsUA8RenK5FZTJ6
	 phJMAOosPEh8es9VSG/clF2h0G8tT8Wu/5Z2H4e2P2vr8MqfbodPeoALOpfYlHmy73h/8
	 AAABdQYQ84yP/N4M/kOAy2Zgzs9THoBHddHqqr+dY3LYV/HU6n4oI4MOS1tO3DIFU31Np
	 vYXzDdASrgkogtSniz4PQIu9I2zyaNAysWDKXYpr5t2/TOhYDzMro9h+MUXRK0hDMGjdm
	 eIExuJsUFDWa+irnEfKmOxQodQ8UTM2zyWu5TOxRjSiTeeG27Wyo2JDpQXzZwIZdq5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271914;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=sfsl0vEvxU/Ixv1S43LGbOFsZ8xd2WGwvs4MQ52W9pk=;
	b=JBARbz2OR6K7r2gLog4uKOS9ZdsDhFSdRvD2RlZv3IrWOpnMGLoeLAr4GNsvZ922SGiB
	 Vgx9P64aanvkHslktdOOba2CKsgF+xk7BRrcbEvx3ggH4Tzx+dsbj4u3cIQa8DFhiu29I
	 eMpenkrvXugFRV2vXMOSz0/i5bKJ+8uRCCuiKlk8BOUT1JJFHSTS/RgOlrvVC9SA61HOx
	 TWqtQmyYUzaFS1CRR/0Nupw9LQz0+CZShF9k+FaLnDk1KXgtvX1nMc3iA9VeXU2GKwTDu
	 x0x2yoU+yo1CkKtGA6UHbCg7YSL58pWlCBtEgHH/Cvmfujm/kJYoHUyhH9b7s0umuwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b="WBfjx/8e";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kKAa0w8u;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36AF606A32A
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 00:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E36AF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=WBfjx/8e;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kKAa0w8u
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 35A511D001A1
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 19:51:53 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 09 Nov 2026 19:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794271912;
	 x=1794358312; bh=sfsl0vEvxU/Ixv1S43LGbOFsZ8xd2WGwvs4MQ52W9pk=; b=
	WBfjx/8edxu/4eaPtcK36DwSAjBvmcVp6vmLi3kuwBAasOsnWXe3LFdK9RMyOanD
	BvlXRm6Zpgs5E6rFS8oVkP69YpWDrdmqm/imXpOLdAFP9Qy9mkmR2nBcJsAGfYDp
	x1h1MNxrOns/skXSmccJdethBYskmFOxDkhFjsP8IT0B5e5lJzRn57EFKwpbc2nN
	lrVhoeThzmiSPATJseBglgPBAKll9wRNoUkqW/0tqeSvAXykLzhi+n4XSpxAHyfJ
	vcKSO/4TI9wbLr5e2+PbZR8vRGRpUgHUsRHWmkFXv6X0mT/aT5jT3oQ6RauQ2XLv
	mCDreYbi4jjEvfo9Bx8LoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794271912; x=
	1794358312; bh=sfsl0vEvxU/Ixv1S43LGbOFsZ8xd2WGwvs4MQ52W9pk=; b=k
	KAa0w8upi1TJVG/tb6DhIrUmkJOr1K3ggW77tgj210SOceX9kOcLau5c3C856JX8
	AdqPPTfdLCdAmyVhKgzBF/pTg6gsIaMzsBASy4zZa5KziTHKxBh2/yJmyD74mM3N
	LpUZXO+34O1/yIY9MQzLYIPWYu/Xv4wtC07HAVn6h7Z92R3c0sd6K2XWDUotjBKz
	gV1rsb4D4mTLsQfpjHAzPjjoyMSp1WWexkmbp0sNdUU0HNqb1X5T5Yd2SCXPUUrs
	SjB4miBn9alxk9H7YqNwUG9SUmuwJHlla9t2VnaklDP4hFb6QTLHCICCfdDTFg+2
	aI1AWXOxwel95TYfYKEig==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794271912; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:P8RU8Mh80nbrW88ltOaYaWwXI4SbO2Vc1F6lk17mJs0FuJL
	KEMLPNCsIOrgUNn4DgN4RUOpZ7Y6AX5XIDJnFCmgo/d+fPeccnNe97wOtAa2ud9J
	A7Fe0a65J97AK8T2plWfrz3NLy/r8upSx0vUTNEh6jN5DZxTCys4jnJ18RQ7yYJb
	J/4ay4PQ8Tx1Itl4VNtACWQJ6IsUiRzojQmeC8fPrCMgKxedmcyFnvClyM0H7IFO
	N6BiN/xGfSMch3gU2M4A3C69DiiKMtpqvlshUgiHphP3jVc0GeQnWVFbPEfalYAq
	w/LIbIYa84Lf+RYZ4V3ew5qLlC9wWInuO32m/5Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:DjYZDj8AWXZrw0aZmqpTzsEU9gJ3ClTub8Nei9DDkHY=:YBcOwyBIC8YvKTrYysH1B1x7wM3DQh3WKmFS4QM9P7M=;
X-ME-Sender: <xms:p2ryakCEcfZu3Q-egA_-jLDSgPXV9CSyWntVe-PwP3pMft_j4IhXWQ>
    <xme:p2ryahWjtTG3aSNGgq92RzYGjh_ugqYEkuKjibupYlbWZ0LyGvX4xsqhtkx0BeiaI
    U7KWsjgXMOrvkkcUOJ-hk16-aIvMH4_YHdjXKbKcm95hOJuTKi8ZX4U>
X-ME-Proxy-Cause: dmFkZTFBnibe1gUXjuAF2ew4mvxm3Ru7XGV72rMlvd9jd0Ag5igXQbPP/PRZ4bWpQXrOj+
    petvBH7xBC5Y7UyRNGYF19YilO/GaVTbYBBMajSc+neykayb8uy+jqDmmGxFLf7+Sdu9FD
    pIXIdaSW+OqaxvD71reKS7hVe40WsDaPa7sAYAa4jy2CSv8VZ1Uyz9NzpBxHMf3nOZgPpt
    nA5YAmiM+/Z+zCZy1Pi4kTZHnID4kCr63F/oYwmxiazwbcdYuOm/jQlYIGvrauPY/87X3A
    8sMtB20GvcIbZ1eqoUzuwB2ONPsuo5yXW3o3s/34y6XHxNPeMHkj89T1HY5HjPdlmznhfv
    xg0S6ZgTjNQT2hT7RBV/2UcZKnCsHOMdmkFfV32e8TEMcPcrtP99qKAPWblhufL2LxF8r1
    uFrSuU1Dr+lAq9OVEXDv3A7LEcrXqlIjvfafeL0vlYE5g0DXNpcsM9hfknY3UPvUGQANZC
    ooIBzJT+05AhhKrxJRMpVIYGjwnzJ2fqDliEAnbxDbaVTD1t1sPfFnLu4vm7e45XwQ0IuP
    K716YM2V11K92bmyyTqR+8uw0+xbaJ8WmMiVSFikF3/4jTeDWJaC5puDTK5V0ijfe/AcxQ
    0pO0wb9AqjgPVDiNc3ucDKW6gPv6FpLUNlI79fNj2P0Yjd7w1cpayoTVuUDQ
X-ME-Proxy: <xmx:p2ryamwYlbvgk6tIJJJhRll2-E1V626g02XncTJInHq2iOfVMJoG7Q>
    <xmx:p2ryaj8JWZE-w3wulezvn7gxE-6i3SR9UcTVZKxz5iBIIpX_XYP7jA>
    <xmx:p2ryarw6SgaWUejwQr5Ywcu04LGoOqBnU0ie4w6qbqkzTcEwSJEvAg>
    <xmx:p2ryasXfHuWgsezIyPRA9kqUA2tItnK7KvnqdZiWoK-VUmp_BNvmvA>
    <xmx:qGryai4BZbKjYAl7AmB9aoQU4mdNELqSSuxGYqSD0NzuymiKx48sQ0VO>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 1437E2C00085; Mon,  9 Nov 2026 19:51:51 -0500 (EST)
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
X-ThreadId: ADQwfFUtXaMB
Date: Mon, 09 Nov 2026 19:51:30 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Mario Limonciello" <superm1@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Maximilian Luz" <luzmaximilian@gmail.com>,
 "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Jai Luthra" <jai.luthra@ideasonboard.com>,
 "Greg KH" <gregkh@linuxfoundation.org>, "Jack Wu" <jackbb_wu@compal.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pm@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <9c290945-0281-469a-a5c9-6e6c2bd93c50@app.fastmail.com>
In-Reply-To: <34c23beb-88d5-4456-b84f-f00e31578468@kernel.org>
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
 <ed4aac63-ac58-4e2a-ae45-ebf4da158228@oss.qualcomm.com>
 <CAJZ5v0gGeKEqMWvP3cQrXztZt-faFZJF+yNfygcBPT57f-a8Lw@mail.gmail.com>
 <34c23beb-88d5-4456-b84f-f00e31578468@kernel.org>
Subject: Re: [PATCH v3 0/4] Make platform profiles firmware independent
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Mon, Nov 9, 2026, at 12:39 PM, Mario Limonciello wrote:
> On 11/9/26 10:46, Rafael J. Wysocki (Intel) wrote:
>> On Mon, Nov 9, 2026 at 5:37=E2=80=AFPM Daniel Lezcano
>> <daniel.lezcano@oss.qualcomm.com> wrote:
>>>
>>>
>>> Hi,
>>>
>>> sashiko validated this series
>>>
>>> Is there any other comments for these changes I should take care of ?
>>=20
>> I'd love to see some feedback from someone having a vested interest in
>> this interface.  Mario?  Mark?
>>=20
> I am onboard with the new approach.
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Ditto. Apologies - I thought I had added my tag already, but if I haven'=
t:
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark

Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E4A3E9C05
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 17:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356270; cv=none; b=C6e5hhzi7AuQfnmOSdkr68p27DYvRWazjxbdikNFeAU6UAKF3R4TzLNUMrx5TjcBMxqgpGiBbfmkC5A+VBfe/YbTw81FNSXK4lhoV9ScR4Gid5Hjge7DZEnL5cpXokolqmBr32rpaBsm2p9BNs+HXHDV/0KvtoyKSzV2HiiEIac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356270; c=relaxed/simple;
	bh=QmSo54jQ6EAogFm1Zsx5zNq2JJNYaOqgJAgH819Vlx4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kaVj6gbLEy4+Y2bmSXVleRk+o4UmkyLGFhNbY0BW0CY/W+ktUZ/yAhImt6i3fo82ERZlXFOaWpy0CJ3hnlDitJQdEBKz4xmhF+QfHtQIsjDH8Gjy4yqi+w4Ik8yzhOGexyGR6AG23ti+gaHQ8LIRebCXjgvmWCHbdfwbIprGyiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=sjipcvIJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SQvN+e2X; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="sjipcvIJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SQvN+e2X"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6818F7A011C;
	Fri, 25 Sep 2026 13:10:54 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 25 Sep 2026 13:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790356254;
	 x=1790442654; bh=zxXwrnmRnmEjzP445fgCbLkgz1omjBBn50U/SM1iNiU=; b=
	sjipcvIJtZHdDXAMiv2NuPrrNRKL1uuIqo6jrMSGBm2EGi2G1GkHitYvYSva3viT
	Q4BrJO11SGcErwX4WGALRLSP/d9CnQAQuwDVvSj44bTFk9jepY/OylIkQxKleJVF
	7N63mDyf8SftTbV57EcpX96JWZPuKxd1DM7H6HeIP63l3bDCCAnvDVDE+Yxg6Pv/
	lrkU2hmW8+QoNuoDqJa97IDxV9MejhFKrb4uen7QG3B8nePnpdlfbwbb9ClX7ZuD
	AzHe5BcrLheBAc2r3HHpBbNe5eYGa0SriEzAIJD0qTqps/5sRMaNQG500yyS3pLF
	t7nerHoOt5vHf0N01L3aOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790356254; x=
	1790442654; bh=zxXwrnmRnmEjzP445fgCbLkgz1omjBBn50U/SM1iNiU=; b=S
	QvN+e2Xq1HH0IiNxuocOg9t0vDf7ylvd3dXLTq4Rt/OMTuKoB5nG95uQvB7Ljmrb
	TIwxoPyxlogE6p5ajZ91rQniDP/F0N9K/kagdGpfx/zRt1a/PSdUhrZBn1A0d1jA
	4AamgjIJq5UDAXNskBMi8YTgEQScbw+oIxxeYPqupwubCTElqBkkgi0wQVRvKchq
	pl8Rv+8NnMTWdv4xBcvnAE6ljkEteYspQfWbzEBMOGOzojkOpNvdGeWyF4j1Czty
	SHf1OHmVvx5GjoqUxZv9t+DbCBbNSlzRqpJcBO12PYXVLgoNnv7aR+2HR5Q+5QCc
	yEeHlBqwf0UU/hjEoj/aw==
X-ME-Sender: <xms:Hau2aiOW9WqRn4UR9-CPywmuwccSKDrMDhwQyr2BM8NYehjd8DFbIw>
    <xme:Hau2arwyR83SbCI0IBRTOEQUqRbDjNzhCk34U9lsrFdq8c8wR55RZgxgQN51SjoR1
    GQ_T_PTxCUvdc6J9NQ4jrt4cF55OdZ4LSo_-MJ9MnJTIbzRVuN4ddR5>
X-ME-Proxy-Cause: dmFkZTE7p87fpZVsudKoer/Uevc2GsLx4ov9HVnuSu9YXhDbVa5mQfd2CBw7JGZiJbTWGD
    oXdoGZm1usMB6Zd9gGSG3w6GNgEdh/3kNNmDDe1JNMllw7h/7wmjd7RwIzjm6tJelp296h
    zb+Nz4eXeT0r74TclzxwLkYocnmAdbJbZyBGwpmkiisfyXK0bCtlDK8tANbcptW77Wf3oZ
    vQo+kIqcDrQkqM8IkUtNS3pMuownFh0eN2xP3ezayrAi7L533+sJIytpy1T3QzM4rpEXZJ
    LaoUlhcSkLXvIVj6xs4F5GWiGMX346HGd57lhsEqBpLeMbgavA26Ijtb/1l11pdOPobESd
    JLYnlTulczbWDTkLoKZgMFcHJoPL8lrGoSILNPOtpwCHFt0rnFPj1UKJWnl9YnjrZYC7kb
    BlnjbVjLESxlc44R/7YmD0TaP2DLYm2UeJzEI1sJDbh86/vVpad2/lXQIsLdIEoz1fo7ft
    0mo8EoEMwhC4Q7RoAt6SR+gkAkwgnu4rydNNJZ8OJxMR+mM95/cKbvK0gAQn9ZUi7AGEY7
    AaxjXUu/SSfXdhUBBqk1ngopcsxf97O0F32gkvcwc4rK5QlFyGF4j6ecOEeyPkeHVyIfOY
    VIemO7lnbpM0ZseWwj5ajxjL5mTzNXQ6sZHSU3gcsUbHIXwnLkozw9XGeiLg
X-ME-Proxy: <xmx:Hau2ar1UouKfT7pfWkngN-0JJJzSc79eIhmz8sY8U6TJKjrQ3tcNmA>
    <xmx:Hau2akJCya0YKxHWNcFC0Nyz5QHflo5nrUICDDF_djGnvZ3SDk5t3A>
    <xmx:Hau2arzd6pQlOOICUuVS9Q4uFXhj-UNrmkk-2uyfPwSHIhAPb2NhQQ>
    <xmx:Hau2aiVM8Go2D50aUf9ylUiwwdYXmLl09VcsoH2x5O6wAaoMUuOYTA>
    <xmx:Hqu2alYcuaCpdaTBalI8-ye_SzjN1RLUh7ur41ZTXy5LlNZvAzEBNYyh>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 977022C0006C; Fri, 25 Sep 2026 13:10:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AxLiYJmP0NXg
Date: Fri, 25 Sep 2026 13:10:33 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: "Prasanth Ksr" <prasanth.ksr@dell.com>, "Armin Wolf" <W_Armin@gmx.de>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dell.Client.Kernel@dell.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <38139df7-48ea-42db-992a-736c6cb73193@app.fastmail.com>
In-Reply-To: <1C5FDB3D-9993-4540-BDFF-1AB6BFAED91F@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <1C5FDB3D-9993-4540-BDFF-1AB6BFAED91F@gmail.com>
Subject: Re: [RFC PATCH 0/5] think LMI v2 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Sep 25, 2026, at 12:49 PM, Derek J. Clark wrote:
> On September 25, 2026 9:00:28 AM PDT, Mark Pearson 
> <mpearson-lenovo@squebb.ca> wrote:
>>Hi all - need help to determine if I'm taking a sensible approach with
>>this patch series.
>>
>>Lenovo are introducing a new 'common' approach to WMI for the Thinkpad,
>>ThinkStation and ThinkCenter platforms. The aim of it is to improve the
>>user experience across all devices, and also to allow some future
>>enhancements. I've been working on the Linux driver implementation so
>>the new version works under Linux.
>>
>>I've called the new version think-lmi v2. 
>>
>>Originally I started by including the changes in the think-lmi driver.
>>There are enough differences in implementation between the versions that
>>it got messy and ugly fast. Surprisingly little commonality could be
>>maintained.
>>
>>So I switched to creating a think-lmi-v2 driver. The original driver
>>becomes think-lmi-v1 and think-lmi would load either v1 or v2 depending
>>on what was available/preferred.
>>
>>Related to this, there is some functionality in the dell-wmi driver that
>>I think can be common so I moved that into wmi core.
>>
>>Would really appreciate any feedback on:
>> - Is this a reasonable approach or is there a better way to solve this?
>> - Any concerns with the changes to the Dell driver. Afraid I can't test
>>   those and I want to be really careful not to mess them up.
>>
>>Many thanks
>>Mark
>>
>>Mark Pearson (5):
>>  platform/x86: think-lmi: rename think-lmi to think-lmi-v1
>>  platform/x86: think-lmi: think-lmi driver to load v1 or v2
>>  platform/x86: wmi: Use common WMI string functions
>>  platform/x86: think-lmi: change name and display_name to pointers
>>  platform/x86: think-lmi: Initial ThinkLMI v2 driver
>>
>> drivers/platform/wmi/core.c                   |   49 +
>> .../dell/dell-wmi-sysman/biosattr-interface.c |   16 +-
>> .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |    2 -
>> .../dell-wmi-sysman/passwordattr-interface.c  |   24 +-
>> .../x86/dell/dell-wmi-sysman/sysman.c         |   40 -
>> drivers/platform/x86/lenovo/Makefile          |    2 +
>> drivers/platform/x86/lenovo/think-lmi-v1.c    | 1857 +++++++++++++++++
>> drivers/platform/x86/lenovo/think-lmi-v2.c    | 1292 ++++++++++++
>> drivers/platform/x86/lenovo/think-lmi.c       | 1847 +---------------
>> drivers/platform/x86/lenovo/think-lmi.h       |   69 +-
>> include/linux/wmi.h                           |    3 +
>> 12 files changed, 3354 insertions(+), 1856 deletions(-)
>> create mode 100644 drivers/platform/x86/lenovo/think-lmi-v1.c
>> create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c
>>
>
> Mark, 
>
> Seems there was a minor mistake with the patch numbering. I went 
> looking for 6/7 and 7/7 before I noticed the cover letter is /5. 
>
> - Derek

Yeah - my fault.

I held back on a couple of the patches as it's still a bit hacky, and not really interesting for the RFC. I tried to clean up the cover letter....but it's not perfect.

This series is really more so I can get feedback on if the approach is reasonable or if I should be doing something else. Happy to take any other comments too of course, but I don't want anybody to burn time too much time on detailed review.

Mark

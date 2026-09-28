Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305CC4F0529;
	Mon, 28 Sep 2026 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614803; cv=none; b=JJBuSYyBb7dHTHoOl29Yaqw29cY8gyyNx29uh/1BMX2zkwUOkZVHoE/6OdfraYa2dPont2gctG4PpJhhC7sfQv+WGfHXV9F+gzsgzhjLkSgZgleyInPonXMD+BgYOCvmEfn84rEj+oQW/kc776wlif0VimxDGLDrOWgCPnerJ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614803; c=relaxed/simple;
	bh=2A4Cjf/v/7EHP55riQz1JIg5vswdQOajDrOKWQ08Su4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pUA1SWDWmIooLLogQLlawJL9CR/VticSF1GW9Kagc0SJLVes7ziUIKQCz9mTfkGnSw4nPpy6EwjBo3HRq9MNP0MA7oqT1rfVywwdeD2U7eRYdnt2s3iIJQKQ+A4sOGzCWArg2gothWbcBZmwhblrlojOZs1dGXOwlCC7efXcgyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=FadH6hJn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uw6ztyaS; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="FadH6hJn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uw6ztyaS"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ED6D3140013C;
	Mon, 28 Sep 2026 13:00:00 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 28 Sep 2026 13:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790614800;
	 x=1790701200; bh=ZJglsxhm+T7RkorCeyNA8WDO/z/MXWq1qh5MZFjk8yo=; b=
	FadH6hJndVR6l38/Z1VxTYIEN15ZpUxsQomlwdRIp2AQF7+E2rQ5Ue2t/P3rKqB7
	yOBTW9qZzql6e7av2i3ZWTQzTe7KbVyWkrGTb3Oksyct7pAyTeTP0DhdlrxmH7gq
	3er2Xp5f5FN3hqFVl2+DnTULBw/Tmdiv8m2F3eC4BZysv424uTEXW2fGy5Qk6K6f
	/xo/mfXqL4H4P1Ud89Y/hfj5KyYU4r4syJsxsvi4kWCHrzGHx/kH/bDgDYik+khm
	whpp6XhVYKUFNu/d0obZ72KraKPl49EeLVOxjGi8YlVXBJrpMUeNNgNjwmus97Ud
	ad9ezNDZwHmOKvxuwNQt/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790614800; x=
	1790701200; bh=ZJglsxhm+T7RkorCeyNA8WDO/z/MXWq1qh5MZFjk8yo=; b=u
	w6ztyaS901XtWcoTqSS3ltTGIczYuT2aL3KcCrN+oBnAR2zf6v0EjVShCMhQFoMK
	u4oKsSTNoDd7Z7dq4Yxu5ZrpQlUrJUzOXmzkbm/FoKPGRjCBVLGRHpkgBdav4MG5
	qbuJ6WksoFQsO0owXUc3cAn0MZloQn0nuO2wHtxdpCFU7VcPmvI6JapCfwR8GOV5
	A9PYUlKKI20exG0+7Ee8Un7knza8ihdahZRD8ozYeFPmNZSrki5BlvWBn1IVEBwS
	WICodjNP9lM3xt4Xt3ndS9Qlmz8KU1WrV5reuY/t5RrbrP+u4naelwr0dME2Hiph
	awo8j+H2FOmQKIODVndJA==
X-ME-Sender: <xms:EJ26anwiXcvH6SxobSYj16GFMQQcI35vRRWTOjORjEtxkUx0xs4MVg>
    <xme:EJ26aqHqgXG8AgW70t39EOKZcA3PEoFTolPuV5abOTEqSJZfnHZ_6BDN7SXEBlSXc
    wZAOPyls_OB-qNTc80f7mEGlpI_xwcFpP_HSSQmzdEVGgC7rWUwBT2b>
X-ME-Proxy-Cause: dmFkZTFecI+GsUIHKZjo1b8Ap4m5Efp3j+z0IgGrkY7dbQDqUsFqSQHsR2nU67adCC54sj
    2GJgZkje11uwGiDv20+jNsdStjUjp2shyBZnutzqImFoRv3u1xPUYsTGct325MVy5MmKFU
    PYrC64Or6VbmqyHhHMlSlblVqSDGkY3lYGVMGwlnPduevZuf3EvkIzO6magYF63ZGRZJ5S
    dWzdV0duzIpog6W9807UwLeiu7Ac2q7JjYWlnDTpCvmPvFAgj0l/aRsIiayv/ZnrJpt/76
    fSra4aRTcLJvXDlscSP/8uukjmjJm1cPESyLp8tg4ygEKGdYiJSfMnZEM81ikgMIEA/DEj
    qzieAH8zJYFrPaooItr+2hEE2ri+rk8iEsSAgQa+hMqlT8J2a7G7gRBzI+e5DJPNLWEXrG
    vkN8GRcbnv9ypNK4wrUyDmD7ueP4EdEKqiwEwAW5iR5FiIY8zupXjLJqXe61Wc1R48J1iV
    4pYjN8xAX26P7wM5HjE5BBXNkuFs/46X8A4msQMagoD2LR2g5SiAGxxTjGPxZ3egoq92md
    rtwbbF0gnC5m/GlogySl6/8K+ss+cu6avk+sUl43ehSo5/TyxCHB4xkybLg5gZWHkqeTvA
    zG5eLU0S4GtGrkJKHP69B299kg7rqhu4gBRzjZBkYKW4jmtKOV7Yfrd4gfbQ
X-ME-Proxy: <xmx:EJ26aq99E6ZpdaaI-YmoxCJ03nn-JLkN41U-Ch9ZzBRVolEUcqXCgg>
    <xmx:EJ26ajoXiNwmnSD-6CX0BzTs__RG4nvuKA7lscW5NFOVVjxEJW42ug>
    <xmx:EJ26arlHgTavvnIZvNwFILU4OL4-TSiXsXqB1Qt514lRBWkbG0jS1Q>
    <xmx:EJ26aigBed9dq9BoUM9M0e75UPWfa36N4i8zf7wZSLWIXM5RRmxayw>
    <xmx:EJ26ah74iBGAaIvTB8CNHmMK8cU44GonAVi8fQx0AImas_c0BSkAX_ie>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 8BC452C0006F; Mon, 28 Sep 2026 13:00:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AR9QFgTacGdo
Date: Mon, 28 Sep 2026 12:59:40 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Mario Limonciello" <superm1@kernel.org>,
 "Bruno BOI" <bruno.boi@bobtopus.eu>,
 "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <41f17736-5868-4f06-acdd-7b0bae71fe10@app.fastmail.com>
In-Reply-To: <0c8bb28c-0814-4446-b8fb-2f07e9174cc2@kernel.org>
References: <20260928160607.679319-1-bruno.boi@bobtopus.eu>
 <20c15bb0-abf3-4a34-86e5-712f8f131acb@amd.com>
 <c22fe14e-41c3-425e-9f8e-39b900ab6e3b@app.fastmail.com>
 <0c8bb28c-0814-4446-b8fb-2f07e9174cc2@kernel.org>
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add Thinkpad L14 Gen3 (21C5) to
 quirk_s2idle_bug
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 28, 2026, at 12:54 PM, Mario Limonciello wrote:
> On 9/28/26 11:53, Mark Pearson wrote:
>> On Mon, Sep 28, 2026, at 12:09 PM, Mario Limonciello wrote:
>>> On 9/28/26 11:06, Bruno BOI wrote:
>>>> The Thinkpad L14 Gen3 with DMI product name 21C5 is affected by the same
>>>> s2idle resume stall as the already listed 21C6 variant: resuming from
>>>> s2idle blocks for several seconds before the kernel resumes.
>>>>
>>>> DMI_MATCH() performs substring matching, so a "21C5" entry also covers
>>>> SKUs such as 21C5S05800. Add the 21C5 model to the existing
>>>> quirk_s2idle_bug table.
>>>>
>>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222070
>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221273
>>>> Signed-off-by: Bruno BOI <bruno.boi@bobtopus.eu>
>>>> ---
>>>> Changes in v2: resent with the correct sender address; the patch
>>>> content is unchanged from v1.
>>>>    drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>
>>> Mark,
>>>
>>> Since it uses prefixes rather than a new entry how would you feel about:
>>>
>>> DMI_MATCH(DMI_PRODUCT_NAME, "21C"),
>>>
>>> On the 21C6 existing entry.
>> 
>> The last char covers a lot of platforms unfortunately
>> 
>> Ignoring the Intel platforms (I assume this driver wouldn't try and load on those - there are a bunch including a Chromebook if that makes any difference)
>> 
>> T14s Gen 3 AMD, X13 Gen 3 AMD, L14 Gen 3 AMD, L15 Gen 3 AMD, T14 Gen 3 AMD, T16 G1 AMD, P16s Gen 1 AMD, K14 AMD would all be impacted.
>> 
>> I probably have a bunch of these to be able to test - but not all (and definitely not the K14).
>> 
>> Adding 21C5 and 21C6 should cover all L14 G3 AMD models.
>> 
>> Mark
>
> Got it; thanks for confirming.  No concerns by me with the new quirk 
> then either.
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

I'll lob in a tag too.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks Bruno

Mark

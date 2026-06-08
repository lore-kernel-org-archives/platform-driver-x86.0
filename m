Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E2F38238D
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 19:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946603; cv=none; b=K+2TzETTWEK7nCrsqDAm0jrNUt8pOyyRH/Jku77eSGYZIzIVnnyhVT3ijGuhUEAanylbu9VUVc0ttBulWKXYXOExbFR/eLtlXHXEnQROibJ4P231vv6Q5BYpZMwKAblJubFI+oZaW6zkgagBRb6g25iKTchHTCj5Tnz6UIrieoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946603; c=relaxed/simple;
	bh=nuRsw70T5Asbww0avPVZfHHVwOjUESUE6/ISQDRJ31o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gAnkil6DBEDI0ot9hlsWZm1nJppz5xljVjwzPXQCtri7EyKzTtJzvLFiGU4RAir+yRIFYRxjSRnE4JiRhPM3ciV3QgMmjNMKF48Z7xFICrXNi5qk5dUojVvu5UrPBegxpqkp/NUuoNNisKBhxXJsagC5xPL1TBRPK7lbqSfE4s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfY2HWmM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHc7QI22; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfY2HWmM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHc7QI22"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IwYho326803
	for <platform-driver-x86@vger.kernel.org>; Mon, 8 Jun 2026 19:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6dxPPr7ceOWyQ4IQHmVd8HESJuuEGxHUdgZy+22Akyw=; b=mfY2HWmMJ7pVn9YH
	bwCiPVSVo9oVWpNOuXxc9sELa0/mYI8k5qb41uu+pAIIhfTKq31fHKQAsO1aufg7
	0FQv5MXW4Y2iM9bQdRP3N5dbwG7hDUbZorO/Ag0moZDViKnznVKb+dPLlu53LruN
	+YzA0qXP9QFVxr7GpJjLxXQpieDS5K4/sC0JAlBS54qsl9ETWTqqacQ6tbZ89ZpE
	ncfE4XEsiWZXIFlZdR+G4+Ky4F+Y/wozj0TlZBUt+rZ92agzAnXs65C/eX94DQlX
	kWmta1J3SCw9XPsj8w72Qs4/1TeIWpqepX21SkoPvorUB3A1xlBf2o5cs/1Y7glq
	g5eNTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8jkm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 19:23:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178fc89b2aso78549721cf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 12:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780946600; x=1781551400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6dxPPr7ceOWyQ4IQHmVd8HESJuuEGxHUdgZy+22Akyw=;
        b=jHc7QI225NMGPnPhtJcOQKv4d+CgvCdnh48+ApfwQfKhegKcR4nlWJZqvF+xOSCfHv
         Uyknl57bGb6cfqX+HRFIYjVgRZ2cIYBp8lc5Pph8d7TxQtMWDs5Hko+4mxTMT/mO1PF2
         YG7cd0pWnORl1NzpJ9aL7Syp1LN+Q3hqA1GsJOi0OCxbv+8/graF9JPYq2T9RiZLfq8s
         6scW0d+B4+gbexMQQRAFCgm3lbHkW0wZC94wr2M0TL4Xh0cm5Z4UhtTipscEzYXxRmEi
         Ckuaj0YvoyeGNiOHuPVKA0v9RaV40gXOCtvgNyEeTnyYFh0VOQnQA8R4vj0HOU5EG5z5
         hRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780946600; x=1781551400;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6dxPPr7ceOWyQ4IQHmVd8HESJuuEGxHUdgZy+22Akyw=;
        b=MKe2X2sPntvDJzpSSs0hjCctn69V+tFaKWjaQ9azdDmvEN2Rkh/xiMqk/EZHL17lGp
         szYPEHFTi25Y/dHJQVt0sGmI/DHkIdeKdfk93n1/njfCMD97pbDp2pW+UxYExAFlizgT
         MtovszzRZR1YtGKr3Ku2nPBHckrLuo3leZ5pcDalcmiGg6rS43VZ7TJL8jGY0w0foQOa
         Gts79YPTgRbMJjpaWVIQao6lRF+e2cO8wCU/CacXM7rwshybpqiPdr3Wq48nzkRLxwN0
         Qxb9c7rqeNqLgQzbO5zL9+agTKTrVlbYHIgusm9FJPUPEZcAUkN6jRHwIeetQ09wD1A6
         /Sag==
X-Gm-Message-State: AOJu0YzEIldSI1MeI+dfAk0woVcvRGbWO0hDkK+6T1cHTzDJjgSAt8zN
	c2zsCQWvmGsgDov5Jx/VrD5ajtSYN46LJQ2Ox4HHHA3ycEbL0Y7sBiAZTJlRWuVGR4+rIi9a8dW
	J3xhldLkegfLwWsCxzQfdpcdWfzaNhqtpO3P3kc79WeAomwSluSao5nXB5JLPKY63iFevqWtSia
	ba
X-Gm-Gg: Acq92OGMAprb31ilaY70qkqJvEbzlrjrv7cceZgT2ah7RMuLtUoBXKzfF/DE1aAC0k1
	GhV9FcGtYaLA+qFaUhgsTDGdgsaaUvISzwgpywtQqD8z+MISHWP2gXhrYw/A5sK+lxwbdmB1oVC
	zxZmpN5d9GcT/eJ0kvIqSL8VkIiaiQuXhl2ws5AG+hqCI3NQEXWELtKcME0SzoNNxsbSQTlFy67
	rb2YTkuFAYEZ82b6djbHHloZqSjdQS+GG2GmPpFGNIiism38zvh9cbyuS9Oal2tcoJXvnwR/CUB
	S1kTD+ej2fPjQNptO8rCChOMLQzgZzwHlkkiCJQbvJ/7RGNk/VIG7WX+b7x+U9iZ2h35JWxUoX2
	Ksu09CDgq5B1KQymBS6W+zaVh48+5F3JAtwzTUkS4O2IXO9EQ883AHE2qh6tiBo/F050b4jYQvT
	1HIIjz/Of9lw7qcVSeWRWVG2oO5pAgCgAIVsCKeTisBnl2wq8lLrgbvDFCpbMy44jie39q2iPNH
	unQtgPT7/9XH3eN2aH/DWRm2kw=
X-Received: by 2002:a05:622a:2613:b0:517:79f0:ae4d with SMTP id d75a77b69052e-517a12d2d6amr217602971cf.19.1780946600395;
        Mon, 08 Jun 2026 12:23:20 -0700 (PDT)
X-Received: by 2002:a05:622a:2613:b0:517:79f0:ae4d with SMTP id d75a77b69052e-517a12d2d6amr217602431cf.19.1780946599886;
        Mon, 08 Jun 2026 12:23:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055500875sm906309466b.53.2026.06.08.12.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 12:23:19 -0700 (PDT)
Message-ID: <73c27728-2f07-41c1-82c7-fd6f46c89f3c@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 21:23:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v5] platform/x86/lenovo: Add Yoga Book 9 keyboard dock
 detection driver
To: Dave Carey <carvsdriver@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, pithenrich2d@googlemail.com,
        mpearson-lenovo@squebb.ca, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, armin.wolf@outlook.de,
        linux-kernel@vger.kernel.org
References: <20260521144034.282419-1-carvsdriver@gmail.com>
 <20260527122701.242907-1-carvsdriver@gmail.com>
 <78833ba9-7ea0-4c7f-8d41-ac0fd64ba15c@oss.qualcomm.com>
 <20260608125211.11957-1-carvsdriver@gmail.com>
 <dda1efcd-f7f5-4ed5-9481-5047d43924cc@oss.qualcomm.com>
 <20260608190507.77836-1-carvsdriver@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260608190507.77836-1-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE3OCBTYWx0ZWRfX62Sgx6Ag87wX
 ips8pyG04yJGM7i5GijoEaZ5xURmmKVYpNeZJ0vj7vgZYaoQfb3YB0WsyCjMRiwD3oSxvR0gvzz
 fMnQc21Z9GQrbVwf+fnCw0GMvXECpDiomrLmLaYRYilq48FU+UJ7oJ4yB9YRrhBGfgfe+h9Y583
 bcw81xi1kU7qwxIJvFGAANfmpkfDrYi0KonZmwcdlQirLqGOytrHwE2mXPhrouDI3ZfhyiyY/q5
 2CFoXvwGSMcM/lDml76Ag8mlxDZ+e2+jMjNI+rSGtyb63P/osIBqleuVNZl7xEPK1q7D6tL8NiI
 Cyw2QSavQ2DO/NRBvsM7LsBVKMn9OI7ZMAHEfpLh+k/GrTH1KYn2l81lcdBp+32otu4LtTp9K84
 MPG0ndPx1IMdCPT15RA1D077jpwOwEDZ20wY9W7u9nszmJ4NLKfpYwXUD4w9E6CsBYhbqet2TmV
 U9bpvwaVOjOt89oZfWg==
X-Proofpoint-ORIG-GUID: Ke_m-CZcTxRHR2F7tMBAjCxBduozmUGt
X-Proofpoint-GUID: Ke_m-CZcTxRHR2F7tMBAjCxBduozmUGt
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a2716a9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=iw09b_tlpInP9k3BYecA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080178

Hi,

On 8-Jun-26 21:05, Dave Carey wrote:
> Hi Hans,
> 
> Confirmed: on the YB9, both lenovo-ymc and yb9-kbdock register input
> nodes with SW_TABLET_MODE in their capability bitmap (SW=2 in
> /proc/bus/input/devices). You are right that this is a problem
> regardless of which one fires events -- GNOME reads the capability at
> startup.
> 
> The recommended fix would be: add a DMI blocklist to lenovo_ymc_probe()
> to return early on the Yoga Book 9, matching on:
> 
>     DMI_MATCH(DMI_SYS_VENDOR,   "LENOVO"),
>     DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
> 
> That leaves yb9-kbdock as the sole SW_TABLET_MODE source on this
> hardware.

Ack, that sounds like the right approach.


> Two questions on how you'd like to proceed:
> 
> 1. Should the lenovo-ymc fix come as a standalone patch, or would you
>    prefer a v6 2-patch series with the ymc change as patch 1/2 and the
>    kbdock driver as patch 2/2?

I think a v6 series makes most sense, even if one of the patches
is just an unmodified reposting of this v5.

> 2. For the early return in probe(): you suggested "return 0" to avoid
>    WMI framework error messages. That requires a NULL guard in
>    lenovo_ymc_notify() since priv is never set in that path. Is that
>    the right approach, or would you prefer a different pattern?

My bad, that should be -ENODEV, so that the driver does not count
as being bound, while still suppressing errors from the caller of
probe. That should avoid lenovo_ymc_notify() getting called.

Assuming there is no other functionality in lenovo-ymc we care
about ...

Regards,

Hans



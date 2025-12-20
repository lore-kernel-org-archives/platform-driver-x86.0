Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B303D2ECE85
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Dec 2025 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246719; cv=none; b=HdMMiYR+si8jwznZQLk5Ihv3/YFZqhqenM0GSTb5hfBh6V+BTN28Lk8i1BGN+hsgupA/F57/H4iWOTOEWtaNMEEJFIivxsPR3e3y6Wr7hZjnPZNxVmnqw5bHu6/kgCYXf8wTq9oC3zM8yTFJjMyjOHmpy2GH64EYpJW9K+mT+wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246719; c=relaxed/simple;
	bh=ZzqG0IHbB778OMxQFRTVwAK7+J5xT4Xdltluh9XydQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFOi5xyz27i8ZgP/cg/3B1ANaPcYqeHiBRjnUpDhof6YcCSD8lTpgAa+kWMY84WFtnkOa87mBYSmX4yGtGuwYn/v+FLqM4Nyu6Mqhs3zU+4Hhapa8EhiUhcvodqYELNq+81PTGBmYiLa5GNkWvA0Bq5XlNFPZQl9dODxOtIeyMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=powBxEOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etd7Mzw6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="powBxEOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etd7Mzw6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBa3mP3667787
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Dec 2025 16:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx7DvDJmvBJJajgCpWJAfurGfDkcJLeLV01NkZc4hv4=; b=powBxEObFMXZnvDe
	IOxY9M46hWsA2j+MXBX7CCNLZXhH+CxQ6crVA/TRVfWE7DBdKkng1Q0xDA/48xsE
	wCa1fy9WghsTIUP+SHdiqjFy8+wozN+HJ7xj6AtXWISF83ftIWuKUgxTQbbIP/P7
	r2r+u54/Rz69LuwCsXaSpahTDyGjxgGm+HTOzeFfV2y6Quwrvpht43l8q+CLoosX
	x5Dr0M98ObA/btre7vc6S+ASc/HXBikuyXMPM4v3qyLTgZKwzplEMsBYa3LoTqqN
	q6gzi8NIFY/RZnh2NS8gkxGX3KDKUd2v+N2JixHuaI0U2KslttK/tVr5q05J/40U
	JvTX9g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrwrxaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Dec 2025 16:05:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8824292911cso85118026d6.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Dec 2025 08:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766246716; x=1766851516; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sx7DvDJmvBJJajgCpWJAfurGfDkcJLeLV01NkZc4hv4=;
        b=etd7Mzw6XYLpeqQYeTkmdJ5l2HDubfXuh7rI4hpGgbMcogVyrjQDJ2E58W9J2uEeRa
         R6KzL1vgdGTVnrvSm/a/ZBOpy3TXaVWVAITYvd/W70GzqtLRTIVm2M+jldw9XeFoMqE3
         n8dj0AUzwlhDkgI2Z5YCGjPr5jXEDRqnFrTLHz29HRKac2vXEOVpw+PEm/1d6+Fi1JJl
         iKhF3boy+JGlRHuWMRGk7qCiiEm4CFsZa6Tk4GE/kwV4E1qGtjG2HIbPD8ulQv7Dk2zY
         VU9Dtmht70lqCPKOys0qBGwswvHNy2QGkq9w/PrSF4iBdnN5nHg9QULeM5XMkhjV3Iqo
         U4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766246716; x=1766851516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx7DvDJmvBJJajgCpWJAfurGfDkcJLeLV01NkZc4hv4=;
        b=Ur6Sk1gQjdPrtvoDA+PdkuHvciWjV3HbKBTR1z9QN/OpDyoceH2wtEu6/0kCB/0dJL
         y1QKNzMUDZwhSXOaEoI9y4EifX19KHcQH4OCl5t/R5IDCN2gobKMymvtdQyCev26xbCV
         Y8oIiH3bBubSugq58QTIOiAVo3J/OHvAtmStIutFNb/cpZAdqXvRrDdJEWh4YeGmIaNq
         nE0AJIsSnrYUD6Zg0I8T6fWfTldWjajCXtdwybXqvwRoOVld0lRCg/VNDM9rHJewadaF
         S582+ydN78B3zbTNmgvulLDJv9i8jZJyQoi2Zd0lHvnzhzy+Jm3Ds5obBAqJpPdvWeRX
         h2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVdpqXYnMwjGGIOzDIL1KxnXIdlOs/GmOQbA4V/xECwOg+y+gTVzRlps0G5+eIMHjp55qN23u9JWp+POmoBt7DB9qXu@vger.kernel.org
X-Gm-Message-State: AOJu0YyA/lkyvzPK0C75yQU815tAwrc5oib/1I+UaeNtLpjFhDq3pjP1
	BtDmhKZcX2TB/pQHPkOSm9gFRegWt5w7+1BOdvCBCVaKpr6p/A07Oqnw1GxFg3jC7OYzDuNv4AS
	UZ2BhWx2qhrxkpbSqqhby3Dj9L3e9ZLGW7qqG7HvC7SMgcMQEkGJ37mObq+jqFV6qD4rh0xWOcK
	Ld
X-Gm-Gg: AY/fxX54gMkDJqvOhDeO+5rOUvNL3I7K2EwWCHL9IjiukHACM9MTdaACj4aduYsb6bj
	R008Kc/QA20DXqmnLsU64FGbcTKvhODdN/218KOE+dSoHUmxCfQX5mWEKnFy/tsWIf8YNKAycOR
	qgUSYauZtt20WoMy+7EcaFwvvc6ADRcGLIhMKcIuWnM0+Jf9fqF5rDcTk9heYNZogQtbJwzUUik
	Vb9UlvIDQGOWLLrdZEYWA7OwHug59LKLuItMzTlD80vTjQ+F3qdR+QoJmXnMVg1zTqf/+ODricm
	IU4qdcqIJPOrq7ylgoU84SzTBWVYWSacC6CmcVHdTu/r6wNdcVfJlYNEzInEaLU2Xs129cjvKCJ
	CHPNEdUublKz6Me3IQoSB2kWO0tAHflX0z9KvDQ/1fGuNGdAZGAriC631c/jQ45Jz0y0lfU8Ipa
	x5T/bv9AmOJYfqBLBZuYUaY68=
X-Received: by 2002:a05:6214:4983:b0:888:7dec:11ff with SMTP id 6a1803df08f44-88d7f5b4884mr104916346d6.0.1766246715836;
        Sat, 20 Dec 2025 08:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9Whl4rMKWU7yncCxutDz2fSapgwvmZZq0Bmc+w/O5q1n+gdugc2XguNuuCW4HIlwTrQY/WQ==
X-Received: by 2002:a05:6214:4983:b0:888:7dec:11ff with SMTP id 6a1803df08f44-88d7f5b4884mr104915726d6.0.1766246715402;
        Sat, 20 Dec 2025 08:05:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d07sm1613067e87.62.2025.12.20.08.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:05:14 -0800 (PST)
Date: Sat, 20 Dec 2025 18:05:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>, jerome.debretagne@gmail.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Dale Whinham <daleyo@gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
Message-ID: <elgdbinyzunhgxaqy432qzxb65qb6yuheiimwutxdtf6q6jjpc@dgcnk3bgwqij>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
 <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
X-Proofpoint-GUID: mZYLRL4ar3oIm3yU-oMxLPZRj8hbL4xY
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=6946c93c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=QPAgtUUt1aV8ZuakPV0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDEzOSBTYWx0ZWRfX4p6YjywobuRv
 eKNQA5q1HPCdO9bSy/tqyhyW8ibUrT7JGtnuEdCtl/dRXkTXahmdFD39DbDdjejV6elvxx5Amaq
 qNEmJaw5RcTQl7x9eVrYD8mnRt8M9m+hxdAIh+/mOcZ2Pd+mQaT9H7R30UTgSCjf7mUR8NLk4eh
 TfzsZL7+zgmesBsJaFkn3gVG5o2hzhai3pe4g/Z95zbbfCklMiU3LIWoxl+5bv4HkMwAsgAInpA
 abEG1TJMF0djBWEqRurh+AriSVj2ZGF4q8p3r2Zz9wYWU6uG7FQGRF9C5THuakSXcJly+5KEiO/
 7pCnJwSZeS+7fiAKMukwoMgrQwvPdAtBHlgBs+jzilPengSKBsJiLc9UO7/dDdPqtWhSJekZSAK
 yntZ25WZjS2IIykX7cZH8lilW5rdHCI8f1YrMqn5tkhKFsBUIvXVVe7mnF5bEp/ahakAF3stfUH
 C2c2n4MPBhecQXDxEvA==
X-Proofpoint-ORIG-GUID: mZYLRL4ar3oIm3yU-oMxLPZRj8hbL4xY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200139

On Sat, Dec 20, 2025 at 10:12:14AM +0100, Krzysztof Kozlowski wrote:
> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
> > On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
> > > From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > > 
> > > For some devices, Wi-Fi is entirely hard blocked by default making
> > > the Wi-Fi radio unusable, except if rfkill is disabled as expected
> > > on those models.
> > > 
> > > Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
> > > disabling specific features based on ACPI bitflag") added a way to
> > > support features set via ACPI, including the DISABLE_RFKILL bit.
> > > 
> > > Add a disable-rfkill property to expose the DISABLE_RFKILL bit
> > > equivalent for devices described by a Devicetree instead of ACPI.
> > > 
> > > Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > > ---
> > >   Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5eaec2c7ff367fd93945 100644
> > > --- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > @@ -29,6 +29,12 @@ properties:
> > >         different 5 GHz subbands. Using them incorrectly could not work or
> > >         decrease performance noticeably
> > > 
> > > +  disable-rfkill:
> > > +    type: boolean
> > > +    description:
> > > +      Disable rfkill for some devices on which Wi-Fi would be entirely hard
> > > +      blocked by default otherwise
> > > +
> > >   additionalProperties: true
> > > 
> > >   examples:
> > > 
> > > --
> > > 2.47.3
> > > 
> > > 
> > > 
> > 
> > Is this really a hardware description though ?
> > 
> > Its really more of a logical/functional description. It tells the runtime
> > what todo, not what the hardware is.
> > 
> > You could also have a list of quirks in ath12k for this or have a user-space
> > utility look for the appropriate platform device string name and disable
> > rfkill.
> > 
> > I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggering on
> > a compat string.
> 
> This is good point. Either this could be deducible from the compatible
> or this should actually describe the hardware and whatever is there
> wired/configured, not what OS should do.

One of the examples _might_ be broken-rfkill, e.g. if the chip expects
to have the actual rfkill control from the EC, but the board doesn't
provide one.

-- 
With best wishes
Dmitry

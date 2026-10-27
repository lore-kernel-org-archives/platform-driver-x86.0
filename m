Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793070413;
	b=M4fcuUvfHkJ3epUEQ9tNdUZ6KgxvBKZijZsmX6qxEp38lKJBymjiEB/VKLN7cjdFt4Pl
	 YIHkp0vx1mSgV63UPUt+qP97YTquveiQfBhIJP+kXKYoTiEvdLhwyizRzggkmQ0LBOTnj
	 WHl7597uJKBTaG2oxOH4aIcEa1nJzmRJTaXzbzDN+PfsYiOPX/RCDdfbIab7ysAb7Hz9C
	 UN1GrOmpBtqSbWTQOas2jOthUU70A6nin9HoSPvc0dkWAv6zg44qSr7K97XgnHLw1BrMp
	 9BBowTg2SBU9m3rn7ko5k6Mxvxi5xpKRUrZhpHlamIq3+8/htCU1/CssgcLybR6UPUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793070413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=QB27yEBKtA/xKDE4Lpw6rAITC1mnPekLzcQwjnT1UyY=;
	b=Bu2AEW0UeNUFSquYqluZnLAS6uT23bDhMlkvf9zIWevfX8SnZXDILhCUM+43neq/a4fN
	 Rapc+waDLtVvl2UWCadUgToG5udM7MkmHyU2W5w5U60Srk/QD8wxvZshR97ohskpMElIN
	 nwC7lWCP4SyvoBx4kEnmKMKm/toijBBzC+cUG1vcvGR+szzrwWHqbcF4TzKKpBIjvmLph
	 FxnX7pkkakn1mIV6P7hPWkVSjO2wLk7QkQSq7EHjYD8ke6qsDTL1Bh2YzMH2pLR2f0faF
	 MEO2LgmAuWiYvYu+//abC1BcXOzfH55S5OlDsa0atS3jKn6edi9Rs03lLFZHsDaLLxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rgTQ9eRx;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C97F606A329
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 03:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C97F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rgTQ9eRx
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36681e85e87so2356758eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 20:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793070412; x=1793675212; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QB27yEBKtA/xKDE4Lpw6rAITC1mnPekLzcQwjnT1UyY=;
        b=rgTQ9eRxSMvwGrirkI272WKRq8mYyvay3ISAHS88evRz97/bTokaePHOPal77r0wIz
         AlL8+2mukmMD9ySrQgDSG644ywd2Q+LvgGN0pwcr8RdSnB7/4dVFTjKeyEY/jROSM7R6
         QH4I0SJ9f40CzkRBYUn2pSyyjCsseY/rAVMOR5IO6R4ajvdkvBRQ3BVH07tTL1ndJyl5
         /i4UEj7QbwDb1W2Ltaxm1DCaHkWDL8awCI9bp2vxq/Wg8xc1oytJd35qDQ2mYjdYZXUp
         5+mK6sfCJgZHmpRq3+60EFt3VN2Vs980U0reSl2nKgj/f+IS1RQ9bkTVu1LKILb2rPEz
         ChKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793070412; x=1793675212;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QB27yEBKtA/xKDE4Lpw6rAITC1mnPekLzcQwjnT1UyY=;
        b=mgnYVOulELcB7uFgvAlmCXmX5ZmHEMbKlBLq4Teb6rCsRtHrylPPDuI4fNFfAsQ8Mz
         JtcwDX7U+EoJdfPNXikbKWgzLpiGw8r6bAOwikUKoDWe/5+iWARzNo9z54a1+qppkwkz
         6km4B9+X5Ie89Q0iShLAaj4s9mI+YjE4FguxgTGwoIleaitiHPexNhawBJz5HSoGNnGz
         WNy218p4HoXpZgizy+9vdxlcGhrO4iXsMAv1Px0G+sNHaq2dO73iExhfFg3jZvgynNFl
         pF/av+kyYO3pFvDzh4fyXr3gX5cjNUMgof+bPzd4U6SYmQuyljC9DlY2ICUFUZlK/jMs
         nQWg==
X-Forwarded-Encrypted: i=1; AKwUvBx06J4yxCQHWYVrPS5dv7MtXt2WKtFwAlWhAOEXMYdtNrayGtg/83szZvfbNBsqf4NYKtbAismgDoU3vrRDn/qw9imE@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6zjxOMgF5a9XotU6ZDhbhSqW3y77JCWAX4L+GfbvDuJU7RINX
	S7UrZZKRj0/stjpR6NCm9bNG9LXPI1XNkOxwAaDDmOClo4MUQRalJkR9
X-Gm-Gg: AYBFou1kMUQUmdlaaq0+XBLvB0gT6MVAImWZdQGNvn1BboEDJxcsL6XguzC5Uk4zAFN
	J++b+4fMbwMoSBHquZ6eYXXkTNac1GCb5iwYg8LB9ooFWIhal6c1GXe6wyxInznkN5m48behjnj
	isOMYXAIC8LIaVd7rPuE2WWTx0OnS65JXGCr1dbCXPeVQrUgTYGAa65MH8Nqcsl1o5/Juuy5EwR
	NM4X1KZvtFxFHybyEJYNOn4bgB4arpYnUEBA5d3yBiwQN4X555R34+MaHIwKxJDzW/oKVmCPxVc
	VAnCs3CHS7JQNOVPZ8FVY/B52mVP70uc4kpg+2GmSiq7dCLWOIOhFymByMEJwS0aKHV8HL4YF6Z
	jI7AqbFEZnh5B3tFkURT713Fme6HTPb2kCr2GuO8VzDLLKVw3lyRShDqO+V7uT7sdHG+RfAHqmz
	0ZzJWqI1ZKeZonfP327wybw1r0MgrRov2I05dNSNtBQ6wasUJBRjTNMRh4scNvQkbWRPZYtrWOG
	5LLiDBoLVI8kQ9RguXYu/7hxBiMAIPwnAuJl/Tn9UDMFIz6MRypjTHn8fASRqUASnYRlSCQrECI
	6oWi5iOQXIDXvvkyoN/Q4AYupZk1ntRSnB/w2csjZm3Q/33KxjCg74pTCQesUo08Vh9hvw==
X-Received: by 2002:a05:693c:20ce:10b0:343:9eb1:9940 with SMTP id 5a478bee46e88-369e849d12fmr12565801eec.26.1793070412156;
        Mon, 26 Oct 2026 20:06:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:2dc1:2e1d:6b4d:5a9a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a11b45b8csm2998795eec.17.2026.10.26.20.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:06:51 -0700 (PDT)
Date: Mon, 26 Oct 2026 20:06:50 -0700
Message-ID: <9499ecc052d84c2c015a27e8e1f34f0a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard controller
In-Reply-To: <35aef2ab2b6607a46eaa0105e8b13c7ba60e5509.camel@rong.moe>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com> <35aef2ab2b6607a46eaa0105e8b13c7ba60e5509.camel@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Rong,

On Sun, Oct 25, 2026 at 10:25:46AM +0800, Rong Zhang wrote:
> > +static const struct input_device_id ideapad_tpswitch_ids[] = {
> > +	{
> > +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> > +				INPUT_DEVICE_ID_MATCH_KEYBIT |
> > +				INPUT_DEVICE_ID_MATCH_ABSBIT,
> > +		.bustype = BUS_I8042,
> > +		.vendor = 0x0002,
>
> Missing INPUT_DEVICE_ID_MATCH_BUS and INPUT_DEVICE_ID_MATCH_VENDOR?
>
> Other than that and the module parameter's name, the patch looks good to
> me. With them fixed:
>
> Reviewed-by: Rong Zhang <i@rong.moe>
> Tested-by: Rong Zhang <i@rong.moe> # not matching other touchpads

Indeed, well spotted! I have added the missing match flags and your tags
in v4.

Thanks.

-- 
Dmitry

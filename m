Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA202FB97E;
	Mon, 15 Sep 2025 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757932378; cv=none; b=j0uOoClZU5vPvJoMJBzkXVqqu8ePlOmiXU9zAC5Ymh8RPw9TqIpr6uTalLMvvaRD2YT3cODE70lLaUkAEevMjx8/eIVy8d/OTULid6axihOgIiqKcX3Kxl6jnIW4zTI47MMil9PVt0B4iHIwLpD2pFzTWmNFo0tqhYxHGPUitOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757932378; c=relaxed/simple;
	bh=7DD+FYFVxKo5eXxhjsD8Le/xHieotvm1eNjR0UnHFN0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Cpz9Z/yeicAlkKzu8P5dGExF/LhLO0N9UorIlJmgrxZMSC8A4TH6SFrDDbX++MQBIFbXtp07H85DKC6B0uUTV9p3eq1YurGGxHgorWYQLkLPAHVYjZbpxS0B5MB3EVDEPn02wvnJ+t3NtbHLMD6yngVJHUQpbsNvw7tPfRC/VLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q97qT8tj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q97qT8tj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757932376; x=1789468376;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7DD+FYFVxKo5eXxhjsD8Le/xHieotvm1eNjR0UnHFN0=;
  b=Q97qT8tjZM2loqh9mDWfIOvcHjwuIRGhHk3NehOhxZ4vuEnpmh3iy4Wi
   Pl0K1pQRKk8f+qB7DAHy2oIbCAlSEgAnMDwwNo5dfxVPipPRqe9QiSXkG
   FzZCtQRFSsLgBPXkw7XxAK0qjG+ZN5+9EisUyp8RgU9d0eiDSQjZ8gsu+
   1MnyAcNyP6AmfB5I/4sFhqZ82rs0PyMSoBehNS4q5tfKhT7akLNJXUCzX
   v63N2iaun3uzWeOdrGFw0yZXHOk1STeH4EG0eRk5G2cWGPe8FdGOezFRx
   VOwDedU9F0eJKwGINQ1ikA7m7szsfv7FzMumb4TMCsPzlBbRg6rRHY62w
   w==;
X-CSE-ConnectionGUID: +KQwHHlOQmOUFb/7LkZZ5Q==
X-CSE-MsgGUID: iq4phYZOQrW3s2O/TIIGxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="59407764"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="59407764"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 03:32:55 -0700
X-CSE-ConnectionGUID: WmRyYp3YTXaEwsEvWGMbxg==
X-CSE-MsgGUID: taLFL3yMRiy3rCKHmDEYwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="175380810"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.39])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 03:32:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 15 Sep 2025 13:32:47 +0300 (EEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: rakuram <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org, 
    "Derek J . Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] Documentation/wmi: Fix Typo in lenovo-wmi-gamezone
In-Reply-To: <31b895a4-edd0-4ce5-a20a-7d0fb67e9721@app.fastmail.com>
Message-ID: <444b64a7-631e-4acf-d2c8-2f0acd379d61@linux.intel.com>
References: <20250817170644.5855-1-rakuram.e96@gmail.com> <31b895a4-edd0-4ce5-a20a-7d0fb67e9721@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Aug 2025, Mark Pearson wrote:
> On Sun, Aug 17, 2025, at 1:06 PM, rakuram wrote:
> > Fixed the below typo error
> >
> > freqency ==> frequency
> > in Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >
> > Signed-off-by: rakuram <rakuram.e96@gmail.com>
> > ---
> >  Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst 
> > b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> > index 997263e51a7d..22040250a97d 100644
> > --- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> > +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> > @@ -153,7 +153,7 @@ data using the `bmfdec 
> > <https://github.com/pali/bmfdec>`_ utility:
> >      [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
> >      [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
> >      [WmiDataId(3), read, Description("Default value.")] uint32 
> > defaultvalue;
> > -    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 
> > OCOffsetFreq;
> > +    [WmiDataId(4), read, Description("OC Offset frequency.")] uint32 
> > OCOffsetFreq;
> >      [WmiDataId(5), read, Description("OC Min offset value.")] uint32 
> > OCMinOffset;
> >      [WmiDataId(6), read, Description("OC Max offset value.")] uint32 
> > OCMaxOffset;
> >      [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 
> > OCOffsetScale;
> > -- 
> > 2.43.0
> 
> Looks good to me.
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Hi,

Isn't the typo in the original interface as well? I'm not very keen in 
accepting this kind of patches as this part is not really user 
documentation to begin with.

-- 
 i.


Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723CE37F746;
	Wed, 13 May 2026 07:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658644; cv=none; b=BFMikyJnqV62vqymJr4kf4T6gQkRsat+F0mEeb25kPU4fVDh4HeHaeS/fJOpqjSzzImXOrqJ3cuXqopJTuEz+QadY/Ss9u3ATrTbEVLnWndjTYL9jh4KbHCqanTtOBtu2Iq8JjxcLr/oIqrpUsm9hAEY3fCLBjhEWigd0w96z2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658644; c=relaxed/simple;
	bh=9zO+X7qcJuLrfISHra/SoTsrxc3AGDRrn9ja3Z0by0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccTJbszPJUW/cEoElURPsfTV/uVEUrCCqQ0YtHhLlvIi+drsSNq8hFxYCWCrTewZnewqFCSf61pxJHRrd2Y6D1uvEx2PzmV2lM6TMjLFDB9rHPtUZvuCvCCGs9YCSZVGsxr7+7E3H/oj0KFvNcVKAWfpq3eCmgPlI4lKvIlzVWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GYDoq85y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GYDoq85y"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B11C229;
	Wed, 13 May 2026 09:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778658630;
	bh=9zO+X7qcJuLrfISHra/SoTsrxc3AGDRrn9ja3Z0by0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYDoq85yGFIKp7GP905CMdOmBzzQxGyolwxs8Tth2SvnZ0PvFCZGY0v05W16+gFXx
	 Dm5HwXzcG4BREi+RVLelWfmBYJJhJXyHqobE6wZV+sdBFeZyJ3SH3oGDq9k1wktxql
	 3hp8aRuHiow00+NsHgobQNZ9vMZuzPyWVt24mDeM=
Date: Wed, 13 May 2026 10:50:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jake Steinman <j@metarealtyinc.ca>
Cc: linux-media@vger.kernel.org, mario.limonciello@dell.com,
	hdegoede@redhat.com, sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com, tianshu.qiu@intel.com,
	tomas.winkler@intel.com, hverkuil-cisco@xs4all.nl,
	kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org,
	libcamera-devel@lists.libcamera.or
Subject: Re: [REQUEST FOR GUIDANCE] =?utf-8?Q?Dell_?=
 =?utf-8?Q?Panther_Lake_IR_camera_=28HIMX1092_=2F_Synaptics_SVP7500_06CB?=
 =?utf-8?Q?=3A0701=29_?= =?utf-8?B?4oCU?= port-2 streaming gated by bridge
 secure-handshake
Message-ID: <20260513075036.GA244931@killaraus.ideasonboard.com>
References: <CAE_FnZKNn0TzpVi+kaDZd91WtO4FN9S9AtXd9UjQZfGDDsxgfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE_FnZKNn0TzpVi+kaDZd91WtO4FN9S9AtXd9UjQZfGDDsxgfA@mail.gmail.com>

On Tue, May 12, 2026 at 09:24:13PM -0400, Jake Steinman wrote:
> Hi all,
> 
> Cold mail to a wide CC, sending once instead of many — apologies for the
> broadcast. Community Linux camera-enable effort on Dell PB16250 (Panther Lake,
> Synaptics SVP7500 bridge USB 06CB:0701). To my knowledge this is the first
> working Linux RGB camera on any Panther Lake laptop — OV08X40 streams at
> 28.57fps after our IRQF_ONESHOT stability fix in intel_cvs, independently
> reproduced on Dell XPS DA16260 + Fedora 44 Silverblue by another community
> user. IR (HIMX1092) does not stream, and I think we've narrowed it cleanly to a
> bridge-internal secure-auth handshake we can't trigger from outside the Vision
> driver stack.
> 
> What works:
> 
> HIMX1092 probes, chip ID 0x1091 confirmed, bound to ipu7-isys CSI-2 port 2, 1
> lane
> Geometry aligned to Dell production (648×368 SGRBG10, from v81
> graph_settings_hm1092 files)
> IPU7 firmware ACKs STREAM_START_AND_CAPTURE
> intel_ipu7_isys: "stream on CSI2-2 with 1 lanes" (RX listening)
> Sensor MODE_SELECT=0x01 ack'd, intel_cvs port-2 mipi config (0x830, verbatim
> Windows USBPcap, 5×52-byte chunked) returns 0
> Cape FW already at Dell v81 level (1.20.129.0, identical bytes)
> What doesn't:
> 
> ZERO sof_event::csi2-2 in any test, including with RGB streaming concurrently
> at 28.57fps
> 10 host-side hypotheses falsified including geometry, format, MIPI replay
> verbatim, AE-kicks, vision_sensing flag, dual-stream
> Evidence the gate is bridge silicon: usbbridge.sys (Intel Vision driver,
> Windows) ships strings RESET_HANDSHAKE_CTX and 1_BRIDGE_STATE_TRIGGER_CTX. Dell
> v81 06CB0701.bin (1.97MB, magic VISSOCFW) is identical to what our cape boots.
> The handshake exists in cape FW; the trigger isn't a wire opcode visible in
> USBPcap, suggesting it crosses MEI/CSE.
> 
> Pinging this group because the answer probably lives at the intersection: Mario
> (Dell upstream routing), Hans (camera-stack architecture, prior bridge
> enabling), Sakari/Bingbu/Tianshu (IPU7 maintainers), Hans Verkuil (V4L2 second
> opinion), Tomas (MEI/CSE if the trigger crosses HECI), Daniel (INT3472 — DSC0
> only exposes HANDSHAKE/IR_LED GPIOs, AVDD/DOVDD appear bridge-internal),
> Laurent/Kieran (libcamera once unblocked).

This seems to be a question for Intel at this point.

> Not asking anyone to debug — just a pointer on whether the secure-auth path can
> be exposed to a non-Vision-stack driver, or who at Intel/Synaptics owns that
> mechanism. Even "talk to <person>" is enormously helpful.
> 
> Background + reproducer:
> 
> - DKMS fix pack (v0.4, MOK-signed, single-command install): https://github.com/
> jibsta210/svp7500-camera-fix-pack/releases/tag/v0.4
> 
> - Forensic write-up + IR debug history: https://gist.github.com/jibsta210/
> 8316b6a0bc58910891512945c4e91a08
> 
> RELATED:
> 
> https://github.com/intel/ipu7-drivers/issues/26
> https://github.com/intel/ipu7-drivers/issues/51
> https://github.com/intel/ipu7-drivers/issues/72
> https://github.com/intel/vision-drivers/issues/37

-- 
Regards,

Laurent Pinchart

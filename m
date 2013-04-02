From: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 1/1] Introduce Intel RAPL cooling device driver
Date: Tue, 2 Apr 2013 16:53:40 -0700
Message-ID: <20130402165340.61b7da02@chromoly>
References: <1364940936-20846-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1364940936-20846-2-git-send-email-jacob.jun.pan@linux.intel.com>
	<20130402230042.GA8713@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:27763 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755043Ab3DBXxn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Apr 2013 19:53:43 -0400
In-Reply-To: <20130402230042.GA8713@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>

On Tue, 2 Apr 2013 16:00:42 -0700
Greg KH <gregkh@linuxfoundation.org> wrote:

> And, one final complaint, never use "raw" kobjects, for loads of good
> reasons, not the least being you just prevented userspace from seeing
> what is happening with your devices.  Use the driver model, that's
> what it is there for, if you need "sub children", or subdirectories.
I chose to use to kobjects for the reason that userspace can see the
device linking more clearly.
Let me try to paraphrase, I have two options:
1. if I use the platform device model instead of raw kobjects, I would
have one platform device for each rapl domain. Then link individual
platform device with the generic thermal layer sysfs.

2. In the current patch, I have one platform driver, then expose per
domain kobject that can be linked to the generic thermal layer. Common
attributes of all domains are grouped under the kset. 

I did consider both options. I thought using #2 option is better since
it allow user to discover the topologies easier by following the
sysfs link. If i use use #1, it would be hard to expose the common
attributes and more code too. Perhpas I misread
Documentation/kobjects.txt which i thought kobject/kset are perfect for
presenting situation like this.

-- 
Thanks,

Jacob

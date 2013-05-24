From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 2/3] driver: provide sysfs interfaces to access TXT
 config space
Date: Fri, 24 May 2013 11:58:34 +0200
Message-ID: <20130524095834.GA14554@amd.pavel.ucw.cz>
References: <1368587074-12712-1-git-send-email-qiaowei.ren@intel.com>
 <1368587074-12712-3-git-send-email-qiaowei.ren@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38459 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752201Ab3EXJ6g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 May 2013 05:58:36 -0400
Content-Disposition: inline
In-Reply-To: <1368587074-12712-3-git-send-email-qiaowei.ren@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qiaowei Ren <qiaowei.ren@intel.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, "Signed-off-by: Gang Wei" <gang.wei@intel.com>, Xiaoyan Zhang <xiaoyan.zhang@intel.com>

On Wed 2013-05-15 11:04:33, Qiaowei Ren wrote:
> These interfaces are located in /sys/devices/platform/intel_txt/config,
> and including totally 37 files, providing access to Intel TXT
> configuration registers.
> 
> Signed-off-by: Qiaowei Ren <qiaowei.ren@intel.com>
> Signed-off-by: Xiaoyan Zhang <xiaoyan.zhang@intel.com>
> Signed-off-by: Gang Wei <gang.wei@intel.com>

You forgot to Cc sysfs maintainer, and proposed interface is not
suitable for reasons explained before.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

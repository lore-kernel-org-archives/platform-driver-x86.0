From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] acer-wmi: do not use 'devices' uninitialized
Date: Tue, 19 Feb 2013 09:07:10 +0100
Message-ID: <1361261230.26423.9.camel@x61.thuisdomein>
References: <1359033178.1325.15.camel@x61.thuisdomein>
	 <1361241494.6635.2.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1361241494.6635.2.camel@linux-s257.site>
Sender: linux-kernel-owner@vger.kernel.org
To: joeyli <jlee@suse.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Joey.

On Tue, 2013-02-19 at 10:38 +0800, joeyli wrote:
> Zhang Rui sent similar patch for fix the warning:
> http://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg04016.html

I see. It didn't make it into the v3.8 release. Could someone please
send a note to the stable list once Zhang's patch hits mainline
(presumably in one of the v3.9 release candidates)?


Paul Bolle

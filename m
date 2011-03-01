From: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] platform-driver-x86: intel_mid_thermal: fix
 unterminated platform_device_id table
Date: Tue, 1 Mar 2011 11:24:47 +0000
Message-ID: <20110301112447.06315465@bob.linux.org.uk>
References: <1298732614.2762.6.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:20228 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756233Ab1CALqM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 1 Mar 2011 06:46:12 -0500
In-Reply-To: <1298732614.2762.6.camel@phoenix>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel@vger.kernel.org, Durgadoss R <durgadoss.r@intel.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Sat, 26 Feb 2011 23:03:34 +0800
Axel Lin <axel.lin@gmail.com> wrote:

> The platform_device_id table is supposed to be zero-terminated.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Acked-by: Alan Cox <alan@linux.intel.com>

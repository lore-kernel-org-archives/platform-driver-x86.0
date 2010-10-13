From: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] intel_pmic_gpio: fix off-by-one value range checking
Date: Wed, 13 Oct 2010 10:11:58 +0100
Message-ID: <20101013101158.1ae2a583@linux.intel.com>
References: <1286531671.6060.1.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:45742 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752193Ab0JMKDh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 Oct 2010 06:03:37 -0400
In-Reply-To: <1286531671.6060.1.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, Alek Du <alek.du@intel.com>, platform-driver-x86@vger.kernel.org

On Fri, 08 Oct 2010 17:54:31 +0800
Axel Lin <axel.lin@gmail.com> wrote:

> In pmic_irq_type(), we use gpio as array index for trigger,
> thus the valid value range for gpio should be 0 .. NUM_GPIO - 1.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Agreed - thanks for spotting this.

Alan

From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 10/11] intel_sgx: glue code for in-kernel LE
Date: Sat, 25 Nov 2017 20:01:50 +0200
Message-ID: <20171125180150.urpvh3tooophagpw@linux.intel.com>
References: <20171117230705.GE25974@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:29768 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751590AbdKYSB4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Nov 2017 13:01:56 -0500
Content-Disposition: inline
In-Reply-To: <20171117230705.GE25974@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 17, 2017 at 03:07:05PM -0800, Darren Hart wrote:
> No incremental cleanup here - appears to all be handled through
> sgx_le_stop - do I have that right?

Yes. This is correct.

/Jarkko

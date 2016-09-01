From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/3] toshiba_acpi: Functions cleanup
Date: Wed, 31 Aug 2016 17:40:03 -0700
Message-ID: <20160901004003.GB80519@f23x64.localdomain>
References: <20160829153736.18273-1-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160829153736.18273-1-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Aug 29, 2016 at 09:37:33AM -0600, Azael Avalos wrote:
> These set of patches make some cleanup in some of the driver's functions.
> 
> The first patch changes the variables declaration, the second changes
> the error checking logic and the third simply fixes a typo found while
> making these changes.

Queued to for-next (with the qualifying comment to 1/3).

> 
> Changes since v1:
> - Small changes to patch 01 acording to Darren's comments
> - Added a missing return on *eco_mode_available function
> 

Please include the changelog in the individual patches below the --- per
Documentation/SubmittingPatches 14) The canonical patch format.

(for future reference)

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center

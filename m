From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH 2/3] ipc: Enabled ipc support for additional intel platforms
Date: Thu, 14 Nov 2013 09:31:38 -0800
Message-ID: <528508FA.5040109@linux.intel.com>
References: <1384373671-12814-1-git-send-email-david.a.cohen@linux.intel.com> <1384373671-12814-3-git-send-email-david.a.cohen@linux.intel.com> <20131114134311.01d24bc5@alan.etchedpixels.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:37020 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754408Ab3KNR1I (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Nov 2013 12:27:08 -0500
In-Reply-To: <20131114134311.01d24bc5@alan.etchedpixels.co.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, eric.ernst@linux.intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

On 11/14/2013 05:43 AM, One Thousand Gnomes wrote:
> On Wed, 13 Nov 2013 12:14:30 -0800
> David Cohen <david.a.cohen@linux.intel.com> wrote:
>
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> Enabled ipc support for penwell, clovertrail & tangier platforms.
>
> At some point this really ought to be discoverable in your SFI, ACPI or
> similar data tables not continually hard coded.

Agreed. But it depends on fw changes, which I believe to happen on
newer platforms only. On driver side we need to fill the missing
resource info with hardcoded values :/

Br, David

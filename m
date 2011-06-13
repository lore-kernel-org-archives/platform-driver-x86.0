From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 10/25] sony-laptop: keyboard backlight support extended
 to newer Vaios
Date: Mon, 13 Jun 2011 16:28:15 +0200
Message-ID: <4DF61E7F.7070406@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE9008D.7040504@absence.it> <20110604075815.GA7194@kamineko.org> <4DF20EB6.2080803@absence.it> <20110612222444.GC31095@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:60574 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753437Ab1FMO2S (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Jun 2011 10:28:18 -0400
In-Reply-To: <20110612222444.GC31095@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 13/06/2011 00:24, Mattia Dongili ha scritto:
> On Fri, Jun 10, 2011 at 02:31:50PM +0200, Marco Chiappero wrote:
>> Il 04/06/2011 09:58, Mattia Dongili ha scritto:
>>
>>>>   struct kbd_backlight {
>>>> -	int mode;
>>>> -	int timeout;
>>>> +	unsigned int base;
>>>> +	unsigned int mode;
>>>> +	unsigned int timeout;
>>>>   	struct device_attribute mode_attr;
>>>>   	struct device_attribute timeout_attr;
>>>>   };
>>>> -
>>>>   static struct kbd_backlight *kbdbl_handle;
>>>> +static int sony_kbd_handle = -1;
>>>
>>> there seems to be no real point initializing this to -1. Also, can it be
>>> made part of the struct above?
>>
>> I'm including these two changes in every patch that provides a new
>> capability using different handles.
>> I need some more time to prepare the new patches, but before
>> resending I'd like to hear some more feedbacks: removing any acpi
>> notification in patch #8, do patches from 1 to 9 look fine? Is it
>> possible to merge them, as they are, as soon as I repost them? If
>
> potentially, if they seem safe yes. I'd rather review what you have than
> a stale version that you're already changing so please send the patches
> over and then we'll see.

Ok, to avoid multiple resends, does this new naming schema look fine to you?

/* Keyboard backlight feature */
static struct sony_kbdbl_data {
	unsigned int handle;
	unsigned int base;
	unsigned int mode;
	unsigned int timeout;
	struct device_attribute mode_attr;
	struct device_attribute timeout_attr;
} *sony_kbdbl;


Another example:

static struct sony_battcare_data {
	unsigned int handle;
	struct device_attribute attrs[2];
} *sony_battcare;


I think that we might use the sony_FEATURE_device namining when we have 
multiple data regarding a physical device rather than just a collection 
of data related to a feature, so sony_kbdbl_data could be named 
sony_kbdbl_device. If you don't like the "sony" prefix, which is not 
much informative, we can change to "snc", which specifies that it's a 
SNC related feature, even though it's already clear enough.
Sorry but I don't really like the current naming schema (using 
kbdbl_handle->handle or kbdbl_handle->snc_handle names doesn't look good 
to me); I'd like to hear comments on this, please.

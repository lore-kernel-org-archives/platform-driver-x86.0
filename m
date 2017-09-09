From: Yehezkel Bernat <yehezkelshb@gmail.com>
Subject: Re: [PATCH v3] Add driver to force WMI Thunderbolt controller power status
Date: Sat, 9 Sep 2017 21:39:24 +0300
Message-ID: <CA+CmpXtDN8FcgY3d5Rg3kzU0S=oAfF5_+feX6oj=mR9JbMhKxQ@mail.gmail.com>
References: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com> <20170909070929.GH2477@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170909070929.GH2477@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Richard Hughes <hughsient@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

(Now in plain text. Sorry about that.)

On Sat, Sep 9, 2017 at 10:09 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Fri, Sep 08, 2017 at 10:23:11AM -0500, Mario Limonciello wrote:
>> Current implementations of Intel Thunderbolt controllers will go
>> into a low power mode when not in use.
>>
>> Many machines containing these controllers also have a GPIO wired up
>> that can force the controller awake.  This is offered via a ACPI-WMI
>> interface intended to be manipulated by a userspace utility.
>>
>> This mechanism is provided by Intel to OEMs to include in BIOS.
>> It uses an industry wide GUID that is populated in a separate _WDG
>> entry with no binary MOF.
>>
>> This interface allows software such as fwupd to wake up thunderbolt
>> controllers to query the firmware version or flash new firmware.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

FWIW,

Reviewed-by: Yehezkel Bernat <yehezkel.bernat@intel.com>

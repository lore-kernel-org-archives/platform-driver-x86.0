From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: asus_wmi: Reserve more space for struct
 bias_args
Date: Fri, 22 May 2020 12:14:29 +0200
Message-ID: <370d5f70-cb37-3ac8-7a7e-97f215b0ad8a@redhat.com>
References: <20200522074424.54264-1-chiu@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200522074424.54264-1-chiu@endlessm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>, dvhart@infradead.org, andy@infradead.org, gregkh@linuxfoundation.org, gayatri.kammela@intel.com, mika.westerberg@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/22/20 9:44 AM, Chris Chiu wrote:
> On the ASUS laptop UX325JA/UX425JA, most of the media keys are not
> working due to the ASUS WMI driver fails to be loaded. The ACPI error
> as follows leads to the failure of asus_wmi_evaluate_method.
>    ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [IIA3] at bit offset/length 96/32 exceeds size of target Buffer (96 bits) (20200326/dsopcode-203)
>    No Local Variables are initialized for Method [WMNB]
>    ACPI Error: Aborting method \_SB.ATKD.WMNB due to previous error (AE_AML_BUFFER_LIMIT) (20200326/psparse-531)
> 
> The DSDT for the WMNB part shows that 5 DWORD required for local
> variables and the 3rd variable IIA3 hit the buffer limit.
> 
> Method (WMNB, 3, Serialized)
> { ..
>      CreateDWordField (Arg2, Zero, IIA0)
>      CreateDWordField (Arg2, 0x04, IIA1)
>      CreateDWordField (Arg2, 0x08, IIA2)
>      CreateDWordField (Arg2, 0x0C, IIA3)
>      CreateDWordField (Arg2, 0x10, IIA4)
>      Local0 = (Arg1 & 0xFFFFFFFF)
>      If ((Local0 == 0x54494E49))
>    ..
> }
> 
> The limitation is determined by the input acpi_buffer size passed
> to the wmi_evaluate_method. Since the struct bios_args is the data
> structure used as input buffer by default for all ASUS WMI calls,
> the size needs to be expanded to fix the problem.
> 
> Signed-off-by: Chris Chiu <chiu@endlessm.com>

Thank you, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/platform/x86/asus-wmi.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index bb7c529d7d16..cd212ee210e2 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -116,6 +116,8 @@ struct bios_args {
>   	u32 arg0;
>   	u32 arg1;
>   	u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
> +	u32 arg4;
> +	u32 arg5;
>   } __packed;
>   
>   /*
> 

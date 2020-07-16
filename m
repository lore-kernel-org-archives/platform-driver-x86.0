From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH V3 1/3] PCI: Add defines for Designated Vendor-Specific
 Capability
Date: Thu, 16 Jul 2020 08:07:56 -0700
Message-ID: <960e7d50-7c6c-45fa-c57e-5c52b5c1e192@infradead.org>
References: <20200716150706.GA628795@bjorn-Precision-5520>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20200716150706.GA628795@bjorn-Precision-5520>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org, dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com, alexander.h.duyck@linux.intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 7/16/20 8:07 AM, Bjorn Helgaas wrote:
> On Wed, Jul 15, 2020 at 07:55:11PM -0700, Randy Dunlap wrote:
>> On 7/13/20 11:23 PM, David E. Box wrote:
>>> Add PCIe DVSEC extended capability ID and defines for the header offsets.
>>> Defined in PCIe r5.0, sec 7.9.6.
>>>
>>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>>> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>>> ---
>>>  include/uapi/linux/pci_regs.h | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
>>> index f9701410d3b5..09daa9f07b6b 100644
>>> --- a/include/uapi/linux/pci_regs.h
>>> +++ b/include/uapi/linux/pci_regs.h
>>> @@ -720,6 +720,7 @@
>>> +#define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
>>> @@ -1062,6 +1063,10 @@
>>> +/* Designated Vendor-Specific (DVSEC, PCI_EXT_CAP_ID_DVSEC) */
>>> +#define PCI_DVSEC_HEADER1		0x4 /* Vendor-Specific Header1 */
>>> +#define PCI_DVSEC_HEADER2		0x8 /* Vendor-Specific Header2 */
>>
>> Just a little comment: It would make more sense to me to
>> s/DVSEC/DVSPEC/g.
> 
> Yeah, that is confusing, but "DVSEC" is the term used in the spec.  I
> think it stands for "Designated Vendor-Specific Extended Capability".

Right. I noticed that after I sent the email.

thanks.
-- 
~Randy

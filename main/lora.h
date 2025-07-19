// LoRa

void lora_reset(void);				// Reset
void lora_explicit_header_mode(void);		// Set explicit header (len in header)
void lora_implicit_header_mode(int size);	// Set implicit header (pre defined size)
void lora_idle(void);				// Set idle mode
void lora_sleep(void);				// Set sleep mode
void lora_receive(void);			// Set receive mode
void lora_set_tx_power(int level);		// Set power 2-17
void lora_set_frequency(long frequency);	// Set frequency (Hz)
void lora_set_spreading_factor(int sf);		// Set spreading factor 6-12
int lora_get_spreading_factor(void);		// Get spreading factor
void lora_set_dio_mapping(int dio, int mode);	// Set DIO mapping for DIO 0-5 mode 0-3
int lora_get_dio_mapping(int dio);		// Get DIO mapping
void lora_set_bandwidth(int sbw);		// Set bandwidth 0-9
int lora_get_bandwidth(void);			// Get bandwidth
void lora_set_coding_rate(int cr);		// Set coding rate 1-4
int lora_get_coding_rate(void);			// Get coding rate
void lora_set_preamble_length(long length);	// Set preamble length (symbols)
long lora_get_preamble_length(void);		// Get preamble length
void lora_set_sync_word(int sw);		// Set sync word
void lora_enable_crc(void);			// Enable CRC
void lora_disable_crc(void);			// Disable CRC
int lora_init(void);				// Init
void lora_send_packet(uint8_t *buf, int size);	// Send packet
int lora_receive_packet(uint8_t *buf, int size);// Receive packet (0 if none available)
int lora_received(void);			// If packet waiting
int lora_get_irq(void);				// Get IRQ flags
int lora_packet_lost(void);			// Lost send packet count
int lora_packet_rssi(void);			// Last received RSSI
float lora_packet_snr(void);			// Last received SNR
void lora_close(void);				// Shutdown
void lora_dump_registers(void);			// Dump registers



